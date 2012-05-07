# encoding: utf-8
module Faker
  module NameVN
    extend ModuleUtils
    extend self

    def name
      "#{middle_name} #{first_name} #{last_name}"
    end

    def first_name
      FIRST_NAMES.rand
    end

    def last_name
      LAST_NAMES.rand
    end

    def middle_name
      MIDDLE_NAMES.rand
    end

    def last_first
       "#{last_name} #{middle_name} #{first_name}"
    end

    LAST_NAMES = k %w(Nguyễn Phạm Trần Lê Huỳnh Hoàng Phan Vũ Võ Đặng Bùi Đỗ Hồ
                      Ngô Dương Lý Bành Cao Châu Chu Chung Diệp Dương Đàm Đào Đinh
                      Đoàn Giang Hà Hàn Kiều Kim La Lạc Lâm Liễu Lục Lương Lưu Mã
                      Mạch Mai Nghiêm Phó Phùng Quách Quang Quyền Tạ Thạch Thái Sái
                      Thi Thân Thảo Thủy Tiêu Tô Tôn Trang Triệu Trịnh Trương Văn
                      Vĩnh Vương Vưu)

    FIRST_NAMES = k %w(Thị Văn Hữu Đức Công Quang)

    MIDDLE_NAMES = k %w(An Bằng Bảo Bay Cảnh Công Cung Đạt Đông Gia Giang Hà Hải
                        Hiệp Hoàng Hùng Huỳnh Khoa Khôi Lai Linh Lộc Long Lưu Mạnh
                        Minh Nam Nghĩa Ngọc Nguyên Ninh Phát Phú Phục Phùng Quân
                        Quang Sơn Quyên Sang Tâm Tân Tạo Thanh Thảo Thiên Thuận
                        Toàn Trúc Trung Tú Tuân Tùng Tưởng Tuyến Văn Việt Vinh Vũ
                        Xương Bich Châu Diệp Hằng Kim Liên Mai Mộng Mỹ Nguyệt Phương
                        Quỳnh Thi Thoa Thu Trinh Tuyết Uyên Yến Anh Dung Hạnh Hoa
                        Hồng Khánh Lan Liêm Nhung Xuân)
  end
end
