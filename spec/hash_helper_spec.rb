describe HashHelper do
  it 'can merge hashes' do
    HashHelper.merge_hashes([{a:1},{b:2}]).should == {a:1,b:2}
    HashHelper.merge_hashes([{a:1},{a:2}]).should == {a:[1,2]}
    HashHelper.merge_hashes([{a:{a:1}},{a:{b:2}}]).should == {a:{a:1,b:2}}
  end
end
