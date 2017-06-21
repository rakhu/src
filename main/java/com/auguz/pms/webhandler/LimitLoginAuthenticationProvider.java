package com.auguz.pms.webhandler;

import java.util.Date;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.apache.log4j.Logger;
import com.auguz.pms.dao.UserDetailsDao;
import com.auguz.pms.model.UserAttempts;

public class LimitLoginAuthenticationProvider extends DaoAuthenticationProvider {


	final static Logger logger = Logger.getLogger(LimitLoginAuthenticationProvider.class);
	UserDetailsDao userDetailsDao;

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {

		try {
			System.out.println("before" + authentication.getAuthorities());
			
			Authentication auth = super.authenticate(authentication);
			System.out.println("after" + authentication.getAuthorities());
			// if reach here, means login success, else exception will be thrown
			// reset the user_attempts
			userDetailsDao.resetFailAttempts(authentication.getName());
			logger.debug("User logged in successfully -" + auth.getName());
			return auth;

		} catch (BadCredentialsException e) {
			logger.error("User login failed due to authetication failure -" + authentication.getName());
			userDetailsDao.updateFailAttempts(authentication.getName());
			throw e;

		} catch (LockedException e) {
			logger.error("User login failed due to locked failure -" + authentication.getName());
			String error = "";
			UserAttempts userAttempts = userDetailsDao.getUserAttempts(authentication.getName());
			if (userAttempts != null) {
				Date lastAttempts = userAttempts.getLastModified();
				error = "User account is locked! <br><br>Username : " + authentication.getName()
						+ "<br>Last Attempts : " + lastAttempts;
			} else {
				error = e.getMessage();
			}

			throw new LockedException(error);
		}

	}

	public UserDetailsDao getUserDetailsDao() {
		return userDetailsDao;
	}

	public void setUserDetailsDao(UserDetailsDao userDetailsDao) {
		this.userDetailsDao = userDetailsDao;
	}

}