#https://github.com/Genymobile/scrcpy/blob/master/doc/linux.md#from-an-install-script
bac_dir=/mnt/chromeos/removable/big/uni
mirror=$bac_dir/mirror.
bac_src=$mirror/src
src_tar=scrcpy.git.tgz

tmp=~/.uni/tmp
src_dir=$tmp/src

build_dir=


restore_src() {
	mkdir -p $src_dir
	if [ ! -d $src_dir/scrcpy ];then
	       cp -r $bac_src/$src_tar $src_dir
	tar xfvz $src_dir/$src_tar
}

clone() {
	if [ ! -d scrcpy ];then
		git clone https://github.com/Genymobile/scrcpy.git
	fi
}

apt_get_install() {
	echo foo
}

bac() {
	if [ ! -f scrcpy.git.tgz ];then
		tar cfvz scrcpy.git.tgz scrcpy
		echo "Backed up"
	fi
}

depends() {
	# FFmpeg, scrcpy.deps
	mkdir -p $tmp

	# Make this a Function so it's Reusable!
	deps=ffmpeg
	if ! command -v meson >/dev/null 2>&1;then
		if [ ! -d $tmp/$deps ];then
			cp -r /mnt/chromeos/removable/big/uni/mirror./pkg/Debian/$deps.tgz ~/tmp/
			cd ~/tmp
			#tar xfvz $deps.tgz
		fi
		cd $tmp/$deps/archives
		sudo dpkg -i *.deb
	fi

	# Make this a Function so it's Reusable!
	deps=scrcpy.build.deps
	if ! command -v meson >/dev/null 2>&1;then
		if [ ! -d $tmp/$deps ];then
			cp -r /mnt/chromeos/removable/big/uni/mirror./pkg/Debian/$deps.tgz ~/tmp/
			cd ~/tmp
			tar xfvz $deps.tgz
		fi
		cd $tmp/$deps/archives
		sudo dpkg -i *.deb
	fi
}

install_this(){
	src_restore
}

first_run() {
	clone
	apt_get_install
	bac
}


main() {
	depends
	#build
	install_this
}

main
