package bean;

import java.io.Serializable;

public class ErrorBean implements Serializable{
	private String code = "001";
	private String msg = "请求错误";

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
}
