class SubscriptionsController < ApplicationController
  def create
    @subscription = Subscription.new(subscription_params)
    @subscription.account_id = current_account.id
    @subscription.save

    redirect_to community_path(@subscription.community_id)
  end

  def destroy
    subscription = Subscription.find params[:id]
    subscription.destroy
    redirect_to root_path
  end

  def subscription_params
    params.require(:subscription).permit(:community_id)
  end
end
