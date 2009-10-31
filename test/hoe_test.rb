require 'test/unit'
require 'fakehoe'

class HoeTest < Test::Unit::TestCase

  def test_spec_with_block
    res = Hoe.spec('nokogiri') do
      developer('Aaron Patterson', 'aaronp@rubyforge.org')
      developer('Mike Dalessio', 'mike.dalessio@gmail.com')
      self.readme_file   = ['README', 'rdoc']
      self.history_file  = ['CHANGELOG', 'rdoc']
      self.extra_rdoc_files  = FileList['*.rdoc']
      self.clean_globs = [
                          'lib/nokogiri/*.{o,so,bundle,a,log,dll}',
                          'lib/nokogiri/nokogiri.rb',
                          'lib/nokogiri/1.{8,9}',
                          'cross'
                         ]
      
      %w{ racc rexical rake-compiler }.each do |dep|
        self.extra_dev_deps << [dep, '>= 0']
      end
      
      self.spec_extras = { :extensions => ["ext/nokogiri/extconf.rb"] }
    end

    assert_equal [], res.spec.require_paths
    assert_equal [], res.spec.extra_rdoc_files
    assert_equal nil, res.spec.platform
  end

  def test_plugin_list
    assert_equal [], Hoe.plugins
    assert_nil Hoe.plugin(:whatever)
  end
end
