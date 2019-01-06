package com.qut.util;

public class NameOrPasswordException extends RuntimeException {
	private static final long serialVersionUID = 1L;
	public static final int NAME = 1;
	public static final int PWD = 2;
	private int field;

	public NameOrPasswordException() {
	}

	public NameOrPasswordException(int field, String message) {
		super(message);
		this.field = field;
	}

	public NameOrPasswordException(Throwable cause) {
		super(cause);
	}

	public NameOrPasswordException(String message, Throwable cause) {
		super(message, cause);
	}

	public int getField() {
		return field;
	}
}
