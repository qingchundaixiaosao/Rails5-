require 'test_helper'

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_index_url
    assert_response :success
    # 以#开头的选择符用户匹配ID，
    # 以点号（.）开头的选择符匹配class属性
    # 而不带前缀的选择符用于匹配元素名称
    # assert_select测试会根据第二个参数的类型发生变化，
    # 如果第二个参数是数字，那么进行的是数量的比较
    # 如果是字符串，则进行内容比较
    # 如果是正则匹配，则验证数据格式是否满足正则
    assert_select '#columns #side a', minimum: 4
    assert_select '#main .entry', 3 # 是否包含3个三个class为entry的类
    assert_select 'h3', 'Programming Ruby 1.9' # 用于验证存在元素名称为h3的元素，并且包含ruby图书的名称
    assert_select '.price', /\$[,\d]+\.\d\d/ # 验证产品价格的格式。
  end

end
