# Restore the original environment variables
if [[ -n "${_TELEMAC_OLD_PATH+x}" ]]; then
    export PATH="${_TELEMAC_OLD_PATH}"
    unset _TELEMAC_OLD_PATH
fi
if [[ -n "${_TELEMAC_OLD_PYTHONPATH+x}" ]]; then
    export PYTHONPATH="${_TELEMAC_OLD_PYTHONPATH}"
    unset _TELEMAC_OLD_PYTHONPATH
fi
if [[ -n "${_TELEMAC_OLD_LD_LIBRARY_PATH+x}" ]]; then
    export LD_LIBRARY_PATH="${_TELEMAC_OLD_LD_LIBRARY_PATH}"
    unset _TELEMAC_OLD_LD_LIBRARY_PATH
fi

unset HOMETEL
unset SYSTELCFG
