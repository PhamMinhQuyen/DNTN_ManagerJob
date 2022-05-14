function Validator(options) {
    function validate(selectElement, rule) {
        var errormessage = rule.test(selectElement.value);
        var errorElement = selectElement.parentElement.querySelector('.form-message');
        if (errormessage) {
            errorElement.innerText = errormessage;
            return errormessage;
        } else {
            errorElement.innerText = '';
        }
    }
    var formElement = document.querySelector(options.form);
    if (formElement) {
        options.rules.forEach(function (rule) {
            var selectElement = formElement.querySelector(rule.selector);

            if (selectElement) {
                selectElement.onblur = function () {
                    validate(selectElement, rule);
                };
                selectElement.onchange = function () {
                    validate(selectElement, rule);
                };

                selectElement.oninput = function () {
                    validate(selectElement, rule);
                };

            }

        });

        formElement.onsubmit = function (event) {
            check = true;
            options.rules.forEach(function (rule) {

                var selectElement = formElement.querySelector(rule.selector);

                if (validate(selectElement, rule)) {
                    check = false;
                    return;
                }

            });
            if (!check) {
                event.preventDefault();
            }
        };

    }
}
;

Validator.isEmail = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng nhập email';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isPassword = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng nhập mật khẩu';
            } else {
                return undefined;
            }
        }
    };
};

/**
 * Validation trang thông tin công ty
 * 
 * @param {type} selector
 * @returns {Validator.isPhoneNumber.validationAnonym$2}
 */
Validator.isPhoneNumber = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            var numberPhone = /^(?:[0-9]\d*|\d)$/;
            if (value == '') {
                return 'Vui lòng nhập số điện thoại';
            } else if (!numberPhone.test(value) || value.length != 10) {
                return 'Số điện thoại không hợp lệ';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isName = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng nhập tên công ty';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isScale = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng chọn số lượng nhân viên';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isWebsite = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng nhập website';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isCareer = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng chọn lĩnh vực';
            } else {
                return undefined;
            }
        }
    };
};


Validator.isAddress = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng nhập địa chỉ';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isTaxCode = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng nhập mã số thuế';
            } else {
                return undefined;
            }
        }
    };
};

/**
 * Validation trang tài khoản người dùng
 * 
 */

Validator.isNameStaff = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng nhập họ và tên';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isGender = function (selector) {
    return {
        selector: selector,
        test: function (value) {

            if (value == '') {
                return 'Vui lòng chọn giới tính';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isBirthday = function (selector) {
    return {
        selector: selector,
        test: function (value) {

            if (value == '') {
                return 'Vui lòng chọn ngày tháng năm sinh';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isCCCD = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            var idCart = /^(?:[0-9]\d*|\d)$/;
            if (value == '') {
                return 'Vui lòng nhập CCCD';
            } else if (!idCart.test(value) || value.length != 12) {
                return 'Số CCCD không hợp lệ';
            } else {
                return undefined;
            }
            ;
        }
    }
};

/**
 * Validation trang thêm mới tin tuyển dụng
 */
Validator.isTitle = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng nhập tiêu đề';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isRank = function (selector) {
    return {
        selector: selector,
        test: function (value) {

            if (value == '') {
                return 'Vui lòng chọn cấp bậc';
            } else {
                return undefined;
            }
        }
    };
};


Validator.isExperience = function (selector) {
    return {
        selector: selector,
        test: function (value) {

            if (value == '') {
                return 'Vui lòng chọn kinh nghiệm';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isQuantity= function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng nhập số lượng cần tuyển';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isCareers = function (selector) {
    return {
        selector: selector,
        test: function (value) {

            if (value == '') {
                return 'Vui lòng chọn ngành nghề';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isWage= function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng nhập vào trường này';
            } else {
                return undefined;
            }
        }
    };
};

/**
 * Validation trang thay đổi mật khẩu
 */
Validator.isNewPassword = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng nhập mật khẩu mới';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isNewPasswordConfirm = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng nhập lại mật khẩu mới';
            } else {
                return undefined;
            }
        }
    };
};





