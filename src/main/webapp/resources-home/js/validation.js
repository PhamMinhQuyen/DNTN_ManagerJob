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
                return 'Vui lòng nhập vào email !';
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
                return 'Vui lòng nhập vào mật khẩu !';
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
                return 'Vui lòng nhập vào số điện thoại !';
            } else if (!numberPhone.test(value) || value.length != 10) {
                return 'Số điện thoại không hợp lệ !';
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
                return 'Vui lòng nhập vào tên công ty !';
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
                return 'Vui lòng chọn số lượng nhân viên !';
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
                return 'Vui lòng nhập vào địa chỉ website !';
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
                return 'Vui lòng chọn lĩnh vực !';
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
                return 'Vui lòng nhập vào địa chỉ !';
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
                return 'Vui lòng nhập vào mã số thuế !';
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
                return 'Vui lòng nhập vào họ và tên !';
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
                return 'Vui lòng chọn giới tính !';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isBirthday = function (selector) {

    function addLeadingZeros(n) {
        if (n <= 9) {
            return "0" + n;
        }
        return n
    }

    return {
        selector: selector,
        test: function (value) {
            var getbyId = (id) => document.querySelector(id);
            let currentDatetime = new Date()
            let formattedDate = currentDatetime.getFullYear() + "-" + addLeadingZeros(currentDatetime.getMonth() + 1) + "-" + addLeadingZeros(currentDatetime.getDate());

            if (value === '') {
                return 'Vui lòng chọn ngày tháng năm sinh !';
            } else if (getbyId('#birthday').value > formattedDate) {
                return 'Ngày tháng năm sinh không lớn hơn ngày tháng năm hiện tại!';
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
                return 'Vui lòng nhập vào CCCD !';
            } else if (!idCart.test(value) || value.length != 12) {
                return 'Số CCCD không hợp lệ !';
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
                return 'Vui lòng nhập vào tiêu đề !';
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
                return 'Vui lòng chọn cấp bậc !';
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
                return 'Vui lòng chọn kinh nghiệm !';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isQuantity = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng nhập vào số lượng cần tuyển !';
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
                return 'Vui lòng chọn ngành nghề !';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isWage = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng nhập vào trường này !';
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
                return 'Vui lòng nhập vào mật khẩu mới !';
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
                return 'Vui lòng nhập lại mật khẩu mới !';
            } else {
                return undefined;
            }
        }
    };
};

/**
 * Validation trang gửi mail
 */
Validator.isContent = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng nhập vào nội dung mail !';
            } else {
                return undefined;
            }
        }
    };
};

/**
 * Validation cập nhật thông tin người dùng
 */
Validator.isMarriage = function (selector) {
    return {
        selector: selector,
        test: function (value) {

            if (value == '') {
                return 'Vui lòng chọn tình trạng hôn nhân !';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isImage = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng chọn hình ảnh !';
            } else {
                return undefined;
            }
        }
    };
};

/**
 * Validation trang cập nhật học vấn 
 */
Validator.isDegree = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng chọn bằng cấp !';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isSchool = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng nhập vào tên trường !';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isGraduationTime = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng chọn thời gian tốt nghiệp !';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isForeignLanguage = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng chọn ngoại ngữ !';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isLevel = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng chọn trình độ !';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isDescription = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng nhập vào mô tả !';
            } else {
                return undefined;
            }
        }
    };
};

/**
 * Validation trang kĩ năng chuyên môn
 */
Validator.isSkill = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng nhập vào kỹ năng !';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isDescriptionSkill = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng nhập vào mô tả kỹ năng !';
            } else {
                return undefined;
            }
        }
    };
};

/**
 * Validation trang kinh nghiệm
 */
Validator.isNumberYear = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng nhập vào số năm kinh nghiệm !';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isPosition = function (selector) {
    return {
        selector: selector,
        test: function (value) {

            if (value == '') {
                return 'Vui lòng chọn chức vụ !';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isStartTime = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            var getbyId = (id) => document.querySelector(id);
            if (value == '') {
                return 'Vui lòng chọn thời gian !';
            } else if (getbyId('#startTime').value > getbyId('#endTime').value) {
                return 'Vui lòng chọn ngày bắt đầu nhỏ hơn ngày kết thúc'
            } else {
                return undefined;
            }
        }
    };
};

Validator.isEndTime = function (selector) {

    return {
        selector: selector,
        test: function (value) {
            var getbyId = (id) => document.querySelector(id);
            if (value === '') {
                return 'Vui lòng chọn thời gian !';
            } else if (getbyId('#startTime').value > getbyId('#endTime').value) {
                return 'Vui lòng chọn ngày kết thúc lớn hơn ngày bắt đầu'
            } else {
                return undefined;
            }
        }
    };
};


/**
 * Validation trang thông tin công việc
 * 
 */
Validator.isAppliedPosition = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng nhập vào vị trí muốn ứng tuyển !';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isSalaryMin = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng nhập vào mức lương tối thiểu !';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isSalaryMax = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng nhập vào mức lương tối đa !';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isFormOfWorking = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng chọn hình thức làm việc !';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isTarget = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng nhập vào mục tiêu nghề nghiệp !';
            } else {
                return undefined;
            }
        }
    };
};

Validator.isCV = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            if (value == '') {
                return 'Vui lòng thêm vào CV của bạn !';
            } else {
                return undefined;
            }
        }
    };
};