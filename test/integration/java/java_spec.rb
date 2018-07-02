describe command('java -version') do
	its(:stderr) { is_expected.to match('1.8.0_172')}
end
