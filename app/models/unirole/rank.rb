# -*- coding: utf-8 -*-

#--
# 版权所有，成都知一软件有限公司
#++

#
# 行政等级，用于区分组织机构的位置层级
# 主要规则如下：
# - 序列号越低，行政等级越高
# - 允许同级序列号存在，但不能同名
#
class Unirole::Rank
  include Mongoid::Document

  field :seq, type: Integer
  field :name, type: String
  field :normal, type: Boolean, default: true
  has_many :organs, class_name: "Unirole::Organ"

  validates_presence_of :seq, :name
  validates_uniqueness_of :name
 
  #
  # 低等级可以成为高等级的下属，反之或者同级则不行
  #
  def member_of? other 
    seq > other.seq
  end
end

