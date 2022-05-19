import sys
from testrail import *

# TestRail connect
testrail_api = 'https://lotuss.testrail.io'
testrail_user = 'nakarin.ladakom@lotusretails.com'
testrail_apikey = 'dAw1nn4dpERVD7o6EeaE-sKyLqCEjAsakPELG9skj'
testrail_case_id = '28904'
client = APIClient(testrail_api)
client.user = testrail_user
client.password = testrail_apikey

# Get phone number from testrail
num_original = client.send_get('get_case/' + testrail_case_id)
num_original = int(num_original['custom_test_data'])

# Increment phone number by 1
num_increment = num_original + 1
num_increment = '0' + str(num_increment)

# Post incremented phone number to testrail
client.send_post('update_case/' + testrail_case_id, {"custom_test_data": num_increment})
print(num_increment)
