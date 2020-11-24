require 'rails_helper'

RSpec.describe ExchangeRateUpdater do
  subject(:updater) { described_class.new }

  describe '#rate_change_blocked?' do
    subject(:rate_change_blocked) { updater.send('rate_change_blocked?') }

    context 'no rates in the database' do
      it { is_expected.to be_truthy }
    end

    context 'changes allowed' do
      context 'these are not manual changes' do
        before { create(:rate, :not_manual) }
        it { is_expected.to be_falsey }

        context 'expiration date not set' do
          it { is_expected.to be_falsey }
        end
      end

      context 'these are manual changes' do
        context 'expiry date expired' do
          before { create(:rate, :manual, :expiry_date_expired) }
          it { is_expected.to be_falsey }
        end
      end
    end

    context 'changes not allowed' do
      context 'these are manual changes' do
        context 'expiry date not expired' do
          before { create(:rate, :manual, :expiry_date_not_expired) }
          it { is_expected.to be_truthy }
        end
      end
    end
  end
end
