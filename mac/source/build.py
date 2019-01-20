from jinja2 import Template
import os

def write_file(filename, data):
    if not os.path.exists(os.path.dirname(filename)):
            os.makedirs(os.path.dirname(filename))
    f = open(filename, "a")
    f.write(data)
    f.close()

def delete_file(filename):
    ## If file exists, delete it ##
    if os.path.isfile(filename):
        os.remove(filename)
    else:    ## Show an error ##
        print("Error: %s file not found" % filename)

def concat_files(vendor_files):
    final = ""
    for the_file_name in vendor_files:
        my_file = open(the_file_name, 'r')
        text = my_file.read()
        final += text + "\n"
        my_file.close()
    return final

def get_vendor_files(filename):
    vendor_dirs=[dI for dI in os.listdir('../vendor') if os.path.isdir(os.path.join('../vendor',dI))]
    vendor_files = ["../vendor/" + dirs + "/" + filename for dirs in vendor_dirs]
    return vendor_files

def get_template_string_from_file(filename):
    if not os.path.exists(os.path.dirname(filename)):
        print("Error: %s template file not found" % filename)
    f = open(filename, "r")
    return f.read()

# install
install_files = get_vendor_files("install.sh")
data = concat_files(install_files)
template = Template(get_template_string_from_file("./install.sh"))
final = template.render(vendor=data)
out_filename = "../build/install.sh"
delete_file(out_filename)
write_file(out_filename, final)

#source
source_files = get_vendor_files("source.sh")
data = concat_files(source_files)
template = Template(get_template_string_from_file("./source.sh"))
final = template.render(vendor=data)
out_filename = "../build/source.sh"
delete_file(out_filename)
write_file(out_filename, final)