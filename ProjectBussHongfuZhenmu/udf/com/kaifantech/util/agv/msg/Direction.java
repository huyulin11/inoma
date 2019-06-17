package com.kaifantech.util.agv.msg;

public enum Direction {
	X_NEG, X_POS, Y_NEG, Y_POS, OTHERS;

	public boolean onYaxis() {
		return this.equals(Y_NEG) || this.equals(Y_POS);
	}

	public boolean onXaxis() {
		return this.equals(X_NEG) || this.equals(X_POS);
	}
}
