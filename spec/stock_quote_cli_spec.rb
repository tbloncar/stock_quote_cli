require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

module StockQuoteCLI
  describe CLI do
    let(:cli) { CLI }

    context 'history' do
      it 'should accept a history method' do
        $stdout.should_receive(:puts).at_least(10).times
        cli.start(["history", "ebay"])
      end

      it 'should accept a range option' do
        $stdout.should_receive(:puts).at_least(14).times
        cli.start(["history", "-r", "20", "fb"])
      end
    end
  end
end