# Case-insensitively and fuzzily validates a string value for obscenity against
# a blacklist of foul language.
#
# Based on Obscenity::Base and Obscenity::ActiveModel from the Obscenity gem.
#
# https://github.com/tjackiw/obscenity/blob/master/lib/obscenity/base.rb
# https://github.com/tjackiw/obscenity/blob/master/lib/obscenity/active_model.rb
class FuzzyObscenityValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, options[:message] || 'cannot be profane') if profane?(value)
  end

  def blacklist
    @blacklist ||= Obscenity::Base.blacklist
  end

  def whitelist
    @whitelist ||= Obscenity::Base.whitelist
  end

  def profane?(text)
    return(false) unless text.to_s.size >= 3

    blacklist.each do |foul|
      return(true) if text =~ /#{foul}/i && !whitelist.include?(foul)
    end

    false
  end
end
