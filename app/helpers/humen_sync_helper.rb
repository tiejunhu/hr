module HumenSyncHelper
  def wsdl_url
    Settings.jira_url + "rpc/soap/jirasoapservice-v2?wsdl"
  end
end
