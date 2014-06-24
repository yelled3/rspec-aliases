require 'json'

class TestRunner

  attr_reader :result

  def initialize
    @result = {}
  end

  def alias_matcher(alias_name, original_name)
    if result[original_name].nil?
      result[original_name] = [alias_name]
    else
      result[original_name] << alias_name
    end
  end

  def alias_method(alias_name, original_name)
    alias_matcher(alias_name, original_name)
  end

  def run_all

    alias_matcher :a_truthy_value, :be_truthy


    alias_matcher :be_falsy,       :be_falsey
    alias_matcher :a_falsey_value, :be_falsey
    alias_matcher :a_falsy_value,  :be_falsey


    alias_matcher :a_nil_value, :be_nil


    alias_matcher :a_value, :be


    alias_method :be_an, :be_a


    alias_method :be_instance_of, :be_an_instance_of
    alias_matcher :an_instance_of, :be_an_instance_of


    alias_method :be_kind_of, :be_a_kind_of
    alias_matcher :a_kind_of,  :be_a_kind_of


    alias_matcher :a_value_between, :be_between


    alias_matcher :a_value_within, :be_within
    alias_matcher :within,         :be_within


    alias_matcher :a_block_changing,  :change
    alias_matcher :changing,          :change


    alias_matcher :a_collection_containing_exactly, :contain_exactly
    alias_matcher :containing_exactly,              :contain_exactly


    alias_matcher :a_range_covering, :cover
    alias_matcher :covering,         :cover


    alias_matcher :a_collection_ending_with, :end_with
    alias_matcher :a_string_ending_with,     :end_with
    alias_matcher :ending_with,              :end_with


    alias_matcher :an_object_eq_to, :eq
    alias_matcher :eq_to,           :eq


    alias_matcher :an_object_eql_to, :eql
    alias_matcher :eql_to,           :eql


    alias_matcher :an_object_equal_to, :equal
    alias_matcher :equal_to,           :equal


    alias_matcher :an_object_existing, :exist
    alias_matcher :existing,           :exist


    alias_matcher :a_collection_including, :include
    alias_matcher :a_string_including,     :include
    alias_matcher :a_hash_including,       :include
    alias_matcher :including,              :include


    alias_matcher :match_regex,        :match
    alias_matcher :an_object_matching, :match
    alias_matcher :a_string_matching,  :match
    alias_matcher :matching,           :match



    alias_matcher :a_block_outputting, :output


    alias_method :raise_exception,  :raise_error

    alias_matcher :a_block_raising,  :raise_error do |desc|
      desc.sub("raise", "a block raising")
    end

    alias_matcher :raising,        :raise_error do |desc|
      desc.sub("raise", "raising")
    end


    alias_matcher :an_object_responding_to, :respond_to
    alias_matcher :responding_to,           :respond_to


    alias_matcher :an_object_satisfying, :satisfy
    alias_matcher :satisfying,           :satisfy


    alias_matcher :a_collection_starting_with, :start_with
    alias_matcher :a_string_starting_with,     :start_with
    alias_matcher :starting_with,              :start_with


    alias_matcher :a_block_throwing, :throw_symbol do |desc|
      desc.sub("throw", "a block throwing")
    end

    alias_matcher :throwing,        :throw_symbol do |desc|
      desc.sub("throw", "throwing")
    end


    alias_matcher :a_block_yielding_control,  :yield_control
    alias_matcher :yielding_control,          :yield_control



    alias_matcher :a_block_yielding_with_no_args,  :yield_with_no_args
    alias_matcher :yielding_with_no_args,          :yield_with_no_args



    alias_matcher :a_block_yielding_with_args,  :yield_with_args
    alias_matcher :yielding_with_args,          :yield_with_args


    alias_matcher :a_block_yielding_successive_args,  :yield_successive_args
    alias_matcher :yielding_successive_args,          :yield_successive_args

  end

end


runner = TestRunner.new

runner.run_all

puts runner.result.to_json




