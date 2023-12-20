/**
	 * 用户名称正则表达式
	 */
	const USERNAME_REGEXP = /^[a-zA-Z]{1}[\w]{1,9}$/;
	
	/**
	 * 用户密码正则表达式
	 */
	const PASSWORD_REGEXP = /^[\w\W]{5,}$/;
	
	/**
	 * 真实姓名正则表达式
	 */
	const REALNAME_REGEXP = /^\S{2,}$/;
	
	/**
	 * 年龄正则表达式
	 */
	const AGE_REGEXP = /^\+?[1-9][0-9]*$/;
	
	/**
	 * 电话正则表达式
	 */
	const PHONE_REGEXP = /^(0\d{2,3}-\d{7,8})$|^(0\d{2,3}\d{7,8})$|^(1[3456789]\d{9})$/;
	
	/**
	 * 性别正则表达式
	 */
	const GENDER_REGEXP = /^男|女$/;
	
	/**
	 * 身份证号正则表达式
	 * /^[\d]{17}[0-9x]{1}$/;
	 */
	const IDCARD_REGEXP = /^\d{17}[\dXx]$/
	
	/**
	 * 邮箱正则表达式
	 * 
	 */
	const EMAIL_REGEXP = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
	
	/**
	 * 名称1正则表达式
	 */
	const NAME_REGEXP = /^\S{2,20}$/;
	
	/**
	 * 名称2正则表达式
	 */
	const NAME2_REGEXP = /^\S{2,}$/;
	
	/**
	 * 数字正则表达式
	 */
	const NUMBER_REGEXP = /^\d+$/;


	
	/**
	 * 日期正则表达式
	 * 2000-02-02
	 */
	const DATE_REGEXP = /^\d{4}-\d{2}-\d{2}$/