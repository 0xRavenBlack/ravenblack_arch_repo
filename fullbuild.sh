#!/bin/bash

function copyto_upload_dir() {
    mv *.pkg.tar.xz ../upload
}

function make_loop() {
    mkdir upload
    for dir in */ ;
    do
        dir=${dir%*/}
        if [ "$dir" == "." ] || [ "$dir" == ".." ] || [ "$dir" == "upload" ]; then
            continue;
        fi
	    cd $dir
	    makepkg -f -c -si --noconfirm
        copyto_upload_dir
        echo "makepkg from "$dir" finished"
        cd ..
    done
}

function sign_packages(){
    cd upload
    FILES=*.pkg.tar.xz
    for f in $FILES
    do
        echo "Signing $f file..."
        gpg --detach-sign --no-armor $f
    done

    cd ..
}

function create_repo() {
    repo-add upload/ ravenblack_arch_repo.db.tar.gz upload/*.pkg.tar.xz
}

make_loop
sign_packages
create_repo
