require 'spec_helper'

describe 'archlinux_macbookretina::macfanctld' do
  let(:facts) {{
    :osfamily        => 'Archlinux',
    :operatingsystem => 'Archlinux',
    :productname     => 'MacBookPro11,4',
    # structured facts
    :os              => { 'family' => 'Archlinux' },
    :dmi             => { 'product' => { 'name' => 'MacBookPro11,4' } },
  }}

  describe "installs packages" do
      it { should compile.with_all_deps }
      it { should contain_package('macfanctld').with_ensure('present') }
      it { should contain_service('macfanctld')
                   .with_ensure('running')
                   .with_enable(true)
      }
  end
end
