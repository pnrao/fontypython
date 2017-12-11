pwd=`pwd`
POFILES=${pwd}/fontypythonmodules/pofiles
LOCALE=${pwd}/fontypythonmodules/locale
VERS=$(shell python2 -c "import fontypythonmodules.fpversion as fpv; print fpv.version")
CH="Copyright (C) 2006,2007,2008,$(shell date +%Y) Donn.C.Ingle"
fpref=${POFILES}/fp_ref.pot
fr_FR=fr_FR.UTF-8.po
de_DE=de_DE.UTF-8.po
it_IT=it_IT.UTF-8.po

refpot :
	# Making the ref.pot file. Fresh from the source.
	# NOTE: The package-name and version do not make it to the final .po files
	# Search me.

	xgettext --package-name="fontypython" \
		--package-version="${VERS}" \
		--copyright-holder=${CH} \
		--msgid-bugs-address="donn.ingle@gmail.com" \
		-p ${POFILES} -o fp_ref.pot -L Python fontypythonmodules/*.py

	# Now run make update

notused :
	# This was fail. I tried to get the header info to be sensible. Can't be done.
	# I had fp_orig_ref.pot containing only the header stuff.
	msgmerge ${POFILES}/fp_orig_ref.pot ${fpref} -o ${fpref}

update :
	# Merge the translation files (.po) with the latest .pot made from the source code.
	# If people send me .po files, I should check they are named properly and then
	# run this update recipe.
	
	# Making copies of the trans files; in case...
	cp ${POFILES}/${fr_FR} ${POFILES}/bak
	cp ${POFILES}/${it_IT} ${POFILES}/bak
	cp ${POFILES}/${de_DE} ${POFILES}/bak

	# Merging the current translation files that exist ("def.po", per the gnu manual)
	# with the fp_ref.pot file. Output OVER the same def.po files.
	#
	# msgmerge [option] def.po ref.pot
	# def.po = exisiting translations
	# ref.po = latest from xgettext
	msgmerge ${POFILES}/${fr_FR} ${fpref} -v --update --backup=off
	msgmerge ${POFILES}/${it_IT} ${fpref} -v --update --backup=off
	msgmerge ${POFILES}/${de_DE} ${fpref} -v --update --backup=off
	
	# Now translate/edit the PO files. When ready, run make mos
	
mos :
	# Converting the PO files to MO files.
	msgfmt ${POFILES}/${fr_FR} -o ${LOCALE}/fr/LC_MESSAGES/all.mo
	msgfmt ${POFILES}/${it_IT} -o ${LOCALE}/it/LC_MESSAGES/all.mo
	msgfmt ${POFILES}/${de_DE} -o ${LOCALE}/de/LC_MESSAGES/all.mo
	
	# mo files have been moved.
	
