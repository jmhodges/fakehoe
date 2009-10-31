require 'rake'

class Hoe
  def self.spec(pkg_name, &blk)
    spec = new(pkg_name, &blk)
    spec.instance_eval &blk
    spec
  end

  def self.plugins
    []
  end

  def self.plugin(p); end

  attr_accessor(:readme_file, :history_file,
                :extra_rdoc_files, :clean_globs,
                :extra_dev_deps, :spec_extras,
                :require_paths, :platform, :name)
  
  def initialize(pkg_name, &blk)
    self.name = pkg_name
    self.extra_dev_deps = []
    self.extra_rdoc_files = []
    self.require_paths = []
    self.platform = 'ruby' # FIXME need to jruby, etc.
    define_tasks
  end

  def developer(n, e); end

  def spec; self; end

  def define_tasks
    task(:check_manifest) {}
    task(:default) {}
  end
end
