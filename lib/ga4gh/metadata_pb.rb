# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: ga4gh/metadata.proto

require 'google/protobuf'

require 'google/protobuf/struct_pb'
Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message "ga4gh.OntologyTerm" do
    optional :id, :string, 1
    optional :term, :string, 2
    optional :source_name, :string, 3
    optional :source_version, :string, 4
  end
  add_message "ga4gh.Dataset" do
    optional :id, :string, 1
    optional :name, :string, 2
    optional :description, :string, 3
    map :info, :string, :message, 4, "google.protobuf.ListValue"
  end
  add_message "ga4gh.Program" do
    optional :command_line, :string, 1
    optional :id, :string, 2
    optional :name, :string, 3
    optional :prev_program_id, :string, 4
    optional :version, :string, 5
  end
end

module Ga4gh
  OntologyTerm = Google::Protobuf::DescriptorPool.generated_pool.lookup("ga4gh.OntologyTerm").msgclass
  Dataset = Google::Protobuf::DescriptorPool.generated_pool.lookup("ga4gh.Dataset").msgclass
  Program = Google::Protobuf::DescriptorPool.generated_pool.lookup("ga4gh.Program").msgclass
end
