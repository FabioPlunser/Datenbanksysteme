#!/bin/bash

# Constants ------

COMMAND_SEPERATOR=.
CHECK_COMMAND=$(COMMAND_SEPERATOR)check
ZIP_COMMAND=$(COMMAND_SEPERATOR)zip

EXCLUDED_FILE_ENDINGS=drawio svg yml pdf zip

# Pattern ------

WORK_SHEET_PATTERN=sheet_%

# Checking Rules ------

.PHONY: $(WORK_SHEET_PATTERN)$(CHECK_COMMAND)
$(WORK_SHEET_PATTERN)$(CHECK_COMMAND): $(WORK_SHEET_PATTERN)/required-files.yml $(WORK_SHEET_PATTERN)$(ZIP_COMMAND)
	@ echo "Checking Files in $(subst $(CHECK_COMMAND),,$@)/:" && echo
	@ cd $(subst $(CHECK_COMMAND),,$@) && \
		python ../check-files.py required-files.yml
	@ echo && echo "Checking Zip Archive $(word 2,$^):" && echo
	@ cd $(subst $(ZIP_COMMAND),,$(word 2,$^)) && \
		python ../check-files.py required-files.yml

.PHONY: $(WORK_SHEET_PATTERN)$(CHECK_COMMAND)
$(WORK_SHEET_PATTERN)$(CHECK_COMMAND): $(WORK_SHEET_PATTERN)/required-files.yml
	@ echo "Checking Files in $(subst $(CHECK_COMMAND),,$@):" && echo
	@ cd $(subst $(CHECK_COMMAND),,$@) && \
		python ../check-files.py required-files.yml

# Zipping Rules ------

$(WORK_SHEET_PATTERN)$(ZIP_COMMAND): %/required-files.yml
	@ echo "Zipping:" && echo
	@ cd $(subst $(ZIP_COMMAND),,$@) && \
		zip ../$(subst $(ZIP_COMMAND),,$@).zip * \
		-x $(foreach file_ending,$(EXCLUDED_FILE_ENDINGS),*.$(file_ending))
	@ echo && echo "Testing Zip:" && echo
	@ cd $(subst $(ZIP_COMMAND),,$@) && \
		python ../check-files.py required-files.yml

$(WORK_SHEET_PATTERN)$(ZIP_COMMAND):
	@ echo "Zipping:" && echo
	@ cd $(subst $(ZIP_COMMAND),,$@) && \
		zip ../$(subst $(ZIP_COMMAND),,$@).zip * \
		-x $(foreach file_ending,$(EXCLUDED_FILE_ENDINGS),*.$(file_ending))

# Cleaning ----

.PHONY: clean
clean:
	@ echo "Cleaning"
	@ rm *$(ZIP_COMMAND)

# End ------
