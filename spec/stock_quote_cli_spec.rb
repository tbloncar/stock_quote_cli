require File.expand_path(File.dirname(__FILE__) + '/spec_helper')


module StockQuoteCLI
	describe CLI do
		it 'should exist' do
			subject.should be_true
		end

		context 'last method called' do
			it 'should accept one argument' do
				subject.stub(:last) { nil }
			end
		end
	end
end