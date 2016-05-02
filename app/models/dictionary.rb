# == Schema Information
#
# Table name: dictionaries
#
#  id                :integer          not null, primary key
#  word              :string           not null
#  urlsafe_word      :string           not null
#  short_explanation :string           not null
#  explanation       :text
#  view_count        :integer          default(0), not null
#  last_view_at      :datetime
#  lock_version      :integer          default(0), not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_dictionaries_on_urlsafe_word  (urlsafe_word) UNIQUE
#  index_dictionaries_on_word          (word) UNIQUE
#

class Dictionary < ActiveRecord::Base
end
