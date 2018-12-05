
# restart nginx locally
alias restart_nginx=' sudo systemctl restart php7.0-fpm nginx && sudo nginx -s reload && echo "nginx restarted"'


# cd shortcut to just need the first part of filename, note just using tab completion
cd()  { builtin cd $@; }                    # Short filename cd

# backup for standard cd
cdd() { builtin cd $@*; }
