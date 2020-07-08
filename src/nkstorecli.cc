#include <stdio.h>
#include <stdlib.h>

#include <iostream>
#include <string>

#include "libnitrokey/NK_C_API.h"

using namespace std;

void usage() {

	cout << "Usage: " << endl;
	cout << "  ./ucli --unlock-encrypted <user_pin>" << endl;
	cout << "  ./ucli --change-admin-pin <old_admin_pin> <new_admin_pin>" << endl;
	cout << "  ./ucli --encrypted-ro <admin_pin>" << endl;
	cout << "  ./ucli --encrypted-rw <admin_pin>" << endl;
	cout << "  ./ucli --unencrypted-ro <admin_pin>" << endl;
	cout << "  ./ucli --unencrypted-rw <admin_pin>" << endl << endl;

}

void handle_ret(const string& desc, int ret) {
	if (ret == 0)
		cout << desc << ": success" << endl;
	else if (ret == 4)
		cout << desc << ": failed - wrong pin" << endl;
	else
		cout << desc << ": failed - return code = " << ret << endl;
}



int main(int argc, char* argv[])
{
        if (NK_login_auto() != 1) {
                fprintf(stderr, "No Nitrokey found.\n");
                return 1;
        }

        NK_device_model model = NK_get_device_model();
        printf("Connected to ");
        switch (model) {
        case NK_PRO:
                printf("a Nitrokey Pro");
                break;
        case NK_STORAGE:
                printf("a Nitrokey Storage");
                break;
        case NK_LIBREM:
                printf("a Librem Key");
                break;
        default:
                printf("an unsupported Nitrokey");
                break;
        }

        char* serial_number = NK_device_serial_number();
        if (serial_number)
            printf(" with serial number %s\n", serial_number);
        else
            printf(" -- could not query serial number!\n");
        free(serial_number);

				
				if (argc < 3) {
					usage();
					return 1;
				}

				string pin = argv[2];
				string cmd = string(argv[1]).substr(2);

				NK_set_debug_level(3);

				int ret = 127;
				if (cmd == "unlock-encrypted") {
						ret = NK_unlock_encrypted_volume(pin.c_str());
						handle_ret("unlock encrypted", ret);
				
				} else if (cmd == "change-admin-pin") {
						if (argc < 4) {
							usage();
							return 1;
						}
						string new_pin = argv[3];
						ret = NK_change_admin_PIN(pin.c_str(), new_pin.c_str());
						handle_ret("change admin pin", ret);

				} else if (cmd == "encrypted-ro") {
					ret = NK_set_encrypted_read_only(pin.c_str());
					handle_ret("set encrypted volume readonly", ret);

				} else if (cmd == "encrypted-rw") {
					ret = NK_set_encrypted_read_write(pin.c_str());
					handle_ret("set encrypted volume read-write", ret);

				} else if (cmd == "unencrypted-ro") {
					ret = NK_set_unencrypted_read_only_admin(pin.c_str());
					handle_ret("set unencrypted volume readonly", ret);

				} else if (cmd == "unencrypted-rw") {
					ret = NK_set_unencrypted_read_write_admin(pin.c_str());
				  handle_ret("set unencrypted volume read-write", ret);
				} else
					usage();
				
        NK_logout();
				return ret;
}
