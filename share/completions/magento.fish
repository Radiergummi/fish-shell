###
# executes fish MySQL commands
#
# To make this work, you'll need to create a __fish user in your
# database, using the following mysql commands:
#
#   mysql> CREATE USER '__fish'@'localhost' IDENTIFIED BY 'your random pw';
#   mysql> GRANT SELECT, SHOW ON * . * TO '__fish'@'localhost';
#   mysql> FLUSH PRIVILEGES;
#
# If no credentials are given, it will simply print nothing, so further commands
# won't show suggestions
###
function __fish_print_magento_mysql_command -d "Executes a MySQL command using the fish user"

### IMPORTANT: ENTER FISH CREDENTIALS HERE #####
  set -l fish_mysql_user __fish
  set -l fish_mysql_pass fish_12479284903518
################################################

  set -l result (mysql -u{$fish_mysql_user} -p{$fish_mysql_pass} -e $argv --skip-column-names 2>&1 | grep -v "mysql:")
  if [ (echo $result | grep ERROR) ]
    return 1
  else
    for i in $result
      echo $i
    end
    return 0
  end
end

function __fish_print_magento_url_protocols -d "Shows all available URL protocols"
  echo http://\t"HTTP"
  echo https://\t"HTTPS"
end

function __fish_print_magento_mysql_engines
  echo MyISAM\t"MyISAM storage engine"
  echo InnoDB\t"Supports transactions, row-level locking, and foreign keys"
  echo BLACKHOLE\t"/dev/null storage engine (anything you write to it disappears)"
  echo MEMORY\t"Hash based, stored in memory, useful for temporary tables"
  echo CSV\t"CSV storage engine"
  echo ARCHIVE\t"Archive storage engine"
end

###

###
# Retrieves all available MySQL users
###
function __fish_print_magento_mysql_users -d "Shows all available MySQL users"
    set -l users (__fish_print_magento_mysql_command 'select user from mysql.user;' | sort -u)

    for i in $users
      echo $i\t"$i"
    end
end

###
# Retrieves all available MySQL databases
###
function __fish_print_magento_mysql_databases -d "Shows all available MySQL databases"
    set -l tables (__fish_print_magento_mysql_command 'show databases;')

    for i in $tables
      echo $i\t"$i"
    end
end

function __fish_print_magento_modules -d "Lists all Magento modules"
  set -l modules (magento module:status)

  for i in $test
    if [ (echo $i) -a (echo $i) != 'None' ]
      echo $i 
    end
  end
end

function __fish_magento_print_indexer_modes -d "Lists all indexer modes"
  echo realtime\t"Index in realtime"
  echo schedule\t"Index via cron jobs"
end

###
# Retrieves all existing magento users from the mysql database
###
function __fish_print_magento_indexer_names -d "Shows all available magento themes"
    set -l indexers (__fish_print_magento_mysql_command 'select indexer_id from indexer_state;')

    for i in $indexers
      echo $i\t"$i"
    end
end

function __fish_print_magento_i18n_packing_modes -d "Shows all available packing modes"
  echo replace\t"replace language pack by new one"
  echo merge\t"merge language packages"
end

function __fish_print_magento_available_ides -d "Shows all IDEs supported by magento"
  echo phpstorm\t"JetBrains PhpStorm"
end

function __fish_print_magento_available_tests -d "Shows all available magento tests"
  echo all\t"all tests"
  echo unit\t"unit tests only"
  echo integration\t"integration tests only"
  echo integration-all\t"all integration tests"
  echo static\t"static file tests only"
  echo static-all\t"all static file tests"
  echo integrity\t"integrity tests only"
  echo legacy\t"legacy tests only"
  echo default\t"all tests"  
end

###
# Retrieves all existing magento themes from the mysql database
###
function __fish_print_magento_themes -d "Shows all available magento themes"
	  set -l themes (__fish_print_magento_mysql_command 'select theme_path from theme;')

    for i in $themes
      echo $i\t"$i"
    end
end

function __fish_print_magento_theme_areas -d "Shows all available magento theme areas"
	echo frontend\t"Frontend"
	echo adminhtml\t"Backend"
end

function __fish_print_magento_languages -d "Shows all existing magento languages"
	echo af_ZA\t"Afrikaans (South Africa)"
	echo sq_AL\t"Albanian (Albania)"
	echo ar_DZ\t"Arabic (Algeria)"
	echo ar_EG\t"Arabic (Egypt)"
	echo ar_KW\t"Arabic (Kuwait)"
	echo ar_MA\t"Arabic (Morocco)"
	echo ar_SA\t"Arabic (Saudi Arabia)"
	echo az_Latn_AZ\t"Azerbaijani (Azerbaijan)"
	echo eu_ES\t"Basque (Spain)"
	echo be_BY\t"Belarusian (Belarus)"
	echo bn_BD\t"Bengali (Bangladesh)"
	echo bs_Latn_BA\t"Bosnian (Bosnia and Herzegovina)"
	echo bg_BG\t"Bulgarian (Bulgaria)"
	echo ca_ES\t"Catalan (Spain)"
	echo zh_Hans_CN\t"Chinese (China)"
	echo zh_Hant_HK\t"Chinese (Hong Kong SAR China)"
	echo zh_Hant_TW\t"Chinese (Taiwan)"
	echo hr_HR\t"Croatian (Croatia)"
	echo cs_CZ\t"Czech (Czech Republic)"
	echo da_DK\t"Danish (Denmark)"
	echo nl_BE\t"Dutch (Belgium)"
	echo nl_NL\t"Dutch (Netherlands)"
	echo en_AU\t"English (Australia)"
	echo en_CA\t"English (Canada)"
	echo en_IE\t"English (Ireland)"
	echo en_NZ\t"English (New Zealand)"
	echo en_GB\t"English (United Kingdom)"
	echo en_US\t"English (United States)"
	echo et_EE\t"Estonian (Estonia)"
	echo fil_PH\t"Filipino (Philippines)"
	echo fi_FI\t"Finnish (Finland)"
	echo fr_BE\t"French (Belgium)"
	echo fr_CA\t"French (Canada)"
	echo fr_FR\t"French (France)"
	echo gl_ES\t"Galician (Spain)"
	echo ka_GE\t"Georgian (Georgia)"
	echo de_AT\t"German (Austria)"
	echo de_DE\t"German (Germany)"
	echo de_CH\t"German (Switzerland)"
	echo el_GR\t"Greek (Greece)"
	echo gu_IN\t"Gujarati (India)"
	echo he_IL\t"Hebrew (Israel)"
	echo hi_IN\t"Hindi (India)"
	echo hu_HU\t"Hungarian (Hungary)"
	echo is_IS\t"Icelandic (Iceland)"
	echo id_ID\t"Indonesian (Indonesia)"
	echo it_IT\t"Italian (Italy)"
	echo it_CH\t"Italian (Switzerland)"
	echo ja_JP\t"Japanese (Japan)"
	echo km_KH\t"Khmer (Cambodia)"
	echo ko_KR\t"Korean (South Korea)"
	echo lo_LA\t"Lao (Laos)"
	echo lv_LV\t"Latvian (Latvia)"
	echo lt_LT\t"Lithuanian (Lithuania)"
	echo mk_MK\t"Macedonian (Macedonia)"
	echo ms_Latn_MY\t"Malay (Malaysia)"
	echo mn_Cyrl_MN\t"Mongolian (Mongolia)"
	echo nb_NO\t"Norwegian Bokmål (Norway)"
	echo nn_NO\t"Norwegian Nynorsk (Norway)"
	echo fa_IR\t"Persian (Iran)"
	echo pl_PL\t"Polish (Poland)"
	echo pt_BR\t"Portuguese (Brazil)"
	echo pt_PT\t"Portuguese (Portugal)"
	echo ro_RO\t"Romanian (Romania)"
	echo ru_RU\t"Russian (Russia)"
	echo sr_Cyrl_RS\t"Serbian (Serbia)"
	echo sk_SK\t"Slovak (Slovakia)"
	echo sl_SI\t"Slovenian (Slovenia)"
	echo es_AR\t"Spanish (Argentina)"
	echo es_CL\t"Spanish (Chile)"
	echo es_CO\t"Spanish (Colombia)"
	echo es_CR\t"Spanish (Costa Rica)"
	echo es_MX\t"Spanish (Mexico)"
	echo es_PA\t"Spanish (Panama)"
	echo es_PE\t"Spanish (Peru)"
	echo es_ES\t"Spanish (Spain)"
	echo es_VE\t"Spanish (Venezuela)"
	echo sw_KE\t"Swahili (Kenya)"
	echo sv_SE\t"Swedish (Sweden)"
	echo th_TH\t"Thai (Thailand)"
	echo tr_TR\t"Turkish (Turkey)"
	echo uk_UA\t"Ukrainian (Ukraine)"
	echo vi_VN\t"Vietnamese (Vietnam)"
	echo cy_GB\t"Welsh (United Kingdom)"
end


function __fish_print_magento_source_theme_file_types -d "Shows all available source theme file types"
  echo less\t"Currently, LESS is the only file type supported"
end

function __fish_print_magento_deploy_modes -d "Shows all available deploy modes"
  echo developer\t"Development mode"
  echo production\t"Production mode"
end

###
# Retrieves all existing magento admin users from the mysql database
###
function __fish_print_magento_users -d "Shows all existing magento admin users"
  set -l users (__fish_print_magento_mysql_command 'select username from admin_user;')

  for i in $users
    echo $i
  end
end

function __fish_print_magento_cache_types -d "Shows all available cache types"
  echo config\t"Configuration"
  echo layout\t"Layout"
  echo block_html\t"Block HTML output"
  echo collections\t"Collections data"
  echo db_ddl\t"Database schema"
  echo eav\t"Entity attribute value (EAV)"
  echo full_page\t"Page cache"
  echo reflection\t"Reflection"
  echo translate\t"Translations"
  echo config_integration\t"Integration configuration"
  echo config_integration_api\t"Integration API configuration"
  echo config_webservice\t"Web services configuration"
end

function __fish_print_magento_verbosity_levels -d "Shows all available verbosity levels"
  echo 1\t"normal output"
  echo 2\t"more verbose output"
  echo 3\t"debug"
end

function __fish_print_magento_list_formats -d "Shows all available output formats"
  echo txt\t"Prints as plain text"
  echo json\t"Prints as JSON"
  echo xml\t"Prints as XML"
end

function __fish_print_magento_commands_list -d "Lists magento commands"
    set -l commands help list admin:user:create admin:user:unlock app:config:dump cache:clean cache:disable cache:enable cache:flush cache:status catalog:images:resize catalog:product:attributes:cleanup cron:run customer:hash:upgrade deploy:mode:set deploy:mode:show dev:source-theme:deploy dev:tests:run dev:urn-catalog:generate dev:xml:convert i18n:collect-phrases i18n:pack i18n:uninstall indexer:info indexer:reindex indexer:reset indexer:set-mode indexer:show-mode indexer:status info:adminuri info:backups:list info:currency:list info:dependencies:show-framework info:dependencies:show-modules info:dependencies:show-modules-circular info:language:list info:timezone:list maintenance:allow-ips maintenance:disable maintenance:enable maintenance:status module:disable module:enable module:status module:uninstall sampledata:deploy sampledata:remove sampledata:reset setup:backup setup:config:set setup:cron:run setup:db-data:upgrade setup:db-schema:upgrade setup:db:status setup:di:compile setup:install setup:performance:generate-fixtures setup:rollback setup:static-content:deploy setup:store-config:set setup:uninstall setup:upgrade theme:uninstall
    for i in $commands
        echo $i
    end
end

#########################################################

function __fish_magento_not_in_command -d "Checks that prompt is not inside of magento command"
    for i in (commandline -opc)
        if contains -- $i (__fish_print_magento_commands_list)
            return 1
        end
    end
    return 0
end

#########################################################

# Perforce command is a single word that comes either as first argument
# or directly after global options.
# To test whether we're in command, it's enough that a command will appear
# in the arguments, even though if more than a single command is specified,
# p4 will complain.
function __fish_magento_is_using_command -d "Checks if prompt is in a specific command"
    if contains -- $argv[1] (commandline -opc)
        return 0
    end
    return 1
end

#########################################################

function __fish_magento_register_command -d "Adds a completion for a specific command"
    complete -c magento -n "__fish_magento_not_in_command" -a $argv[1] $argv[2..-1]
end

#########################################################

function __fish_magento_register_command_option -d "Adds a specific option for a command"
    complete -c magento -n "__fish_magento_is_using_command $argv[1]" $argv[2..-1]
end



##################
# Global options #
##################
complete -x -c magento -s h -l help -d "Displays help for a command";
complete -x -c magento -s q -l quiet -d "Do not output any message";
complete -x -c magento -s v -l verbose -a "(__fish_print_magento_verbosity_levels)" -d "Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug";
complete -x -c magento -o -vv;
complete -x -c magento -o vvv;
complete -x -c magento -s V -l version        -d "Display this application version";
complete -x -c magento      -l ansi           -d "Force ANSI output";
complete -x -c magento      -l no-ansi        -d "Disable ANSI output";
complete -x -c magento -s n -l no-interaction -d "Do not ask any interactive question";

################
# Sub-Commands #
################
__fish_magento_register_command help -a "(__fish_print_magento_commands_list)" -d "Displays help for a command";
__fish_magento_register_command list -d "Lists commands";

__fish_magento_register_command admin:user:create -x -d "Creates an administrator";
__fish_magento_register_command admin:user:unlock -x -d "Unlock Admin Account";

__fish_magento_register_command app:config:dump -d "Create dump of application";

__fish_magento_register_command cache:clean -d "Cleans cache type(s)";
__fish_magento_register_command cache:disable -d "Disables cache type(s)";
__fish_magento_register_command cache:enable -d "Enables cache type(s)";
__fish_magento_register_command cache:flush -d "Flushes cache storage used by cache type(s)";
__fish_magento_register_command cache:status -d "Checks cache status";

__fish_magento_register_command catalog:images:resize -d "Creates resized product images";
__fish_magento_register_command catalog:product:attributes:cleanup -d "Removes unused product attributes.";

__fish_magento_register_command cron:run -d "Runs jobs by schedule";

__fish_magento_register_command customer:hash:upgrade -d "Upgrade customer's hash according to the latest algorithm";

__fish_magento_register_command deploy:mode:set -d "Set application mode.";
__fish_magento_register_command deploy:mode:show -d "Displays current application mode.";

__fish_magento_register_command dev:source-theme:deploy -d "Collects and publishes source files for theme.";
__fish_magento_register_command dev:tests:run -d "Runs tests";
__fish_magento_register_command dev:urn-catalog:generate -d "Generates the catalog of URNs to *.xsd mappings for the IDE to highlight xml.";
__fish_magento_register_command dev:xml:convert -d "Converts XML file using XSL style sheets";

__fish_magento_register_command i18n:collect-phrases -d "Discovers phrases in the codebase";
__fish_magento_register_command i18n:pack -d "Saves language package";
__fish_magento_register_command i18n:uninstall -d "Uninstalls language packages";

__fish_magento_register_command indexer:info -d "Shows allowed Indexers";
__fish_magento_register_command indexer:reindex -d "Reindexes Data";
__fish_magento_register_command indexer:reset -d "Resets indexer status to invalid";
__fish_magento_register_command indexer:set-mode -d "Sets index mode type";
__fish_magento_register_command indexer:show-mode -d "Shows Index Mode";
__fish_magento_register_command indexer:status -d "Shows status of Indexer";

__fish_magento_register_command info:adminuri -d "Displays the Magento Admin URI";
__fish_magento_register_command info:backups:list -d "Prints list of available backup files";
__fish_magento_register_command info:currency:list -d "Displays the list of available currencies";
__fish_magento_register_command info:dependencies:show-framework -d "Shows number of dependencies on Magento framework";
__fish_magento_register_command info:dependencies:show-modules -d "Shows number of dependencies between modules";
__fish_magento_register_command info:dependencies:show-modules-circular -d "Shows number of circular dependencies between modules";
__fish_magento_register_command info:language:list -d "Displays the list of available language locales";
__fish_magento_register_command info:timezone:list -d "Displays the list of available timezones";

__fish_magento_register_command maintenance:allow-ips -d "Sets maintenance mode exempt IPs";
__fish_magento_register_command maintenance:disable -d "Disables maintenance mode";
__fish_magento_register_command maintenance:enable -d "Enables maintenance mode";
__fish_magento_register_command maintenance:status -d "Displays maintenance mode status";

__fish_magento_register_command module:disable -d "Disables specified modules";
__fish_magento_register_command module:enable -d "Enables specified modules";
__fish_magento_register_command module:status -d "Displays status of modules";
__fish_magento_register_command module:uninstall -d "Uninstalls modules installed by composer";

__fish_magento_register_command sampledata:deploy -d "Deploy sample data modules";
__fish_magento_register_command sampledata:remove -d "Remove all sample data packages from composer.json";
__fish_magento_register_command sampledata:reset -d "Reset all sample data modules for re-installation";

__fish_magento_register_command setup:backup -d "Takes backup of Magento Application code base, media and database";
__fish_magento_register_command setup:config:set -d "Creates or modifies the deployment configuration";
__fish_magento_register_command setup:cron:run -d "Runs cron job scheduled for setup application";
__fish_magento_register_command setup:db-data:upgrade -d "Installs and upgrades data in the DB";
__fish_magento_register_command setup:db-schema:upgrade -d "Installs and upgrades the DB schema";
__fish_magento_register_command setup:db:status -d "Checks if DB schema or data requires upgrade";
__fish_magento_register_command setup:di:compile -d "Generates DI configuration and all missing classes that can be auto-generated";
__fish_magento_register_command setup:install -d "Installs the Magento application";
__fish_magento_register_command setup:performance:generate-fixtures -d "Generates fixtures";
__fish_magento_register_command setup:rollback -d "Rolls back Magento Application codebase, media and database";
__fish_magento_register_command setup:static-content:deploy -d "Deploys static view files";
__fish_magento_register_command setup:store-config:set -d "Installs the store configuration";
__fish_magento_register_command setup:uninstall -d "Uninstalls the Magento application";
__fish_magento_register_command setup:upgrade -d "Upgrades the Magento application, DB data, and schema";

__fish_magento_register_command theme:uninstall -d "Uninstalls a theme";

#
# help
#
__fish_magento_register_command_option help -x -a "(__fish_print_magento_commands_list)" -d "Displays help for a command";

#
# list
#
__fish_magento_register_command_option list -f -l xml -d "To output list as XML";
__fish_magento_register_command_option list -f -l raw -d "To output raw command list";
__fish_magento_register_command_option list -f -l format -a "(__fish_print_magento_list_formats)" -d "To output list in other formats (default: txt)";

#
# admin:user:create
#
__fish_magento_register_command_option admin:user:create -f -r -l admin-user          -d "(Required) Admin user";
__fish_magento_register_command_option admin:user:create -f -r -l admin-password      -d "(Required) Admin password";
__fish_magento_register_command_option admin:user:create -f -r -l admin-email         -d "(Required) Admin email";
__fish_magento_register_command_option admin:user:create -f -r -l admin-firstname     -d "(Required) Admin first name";
__fish_magento_register_command_option admin:user:create -f -r -l admin-lastname      -d "(Required) Admin last name";
__fish_magento_register_command_option admin:user:create -f    -l magento-init-params -d "Add to any command to customize Magento initialization parameters";

__fish_magento_register_command_option admin:user:create -f -s h -l help           -d "Display this help message";
__fish_magento_register_command_option admin:user:create -f -s q -l quiet          -d "Do not output any message";
__fish_magento_register_command_option admin:user:create -f -s V                   -d "Display this application version";
__fish_magento_register_command_option admin:user:create -f      -l ansi           -d "Force ANSI output";
__fish_magento_register_command_option admin:user:create -f      -l no-ansi        -d "Disable ANSI output";
__fish_magento_register_command_option admin:user:create -f -s n -l no-interaction -d "Do not ask any interactive question";
__fish_magento_register_command_option admin:user:create -f -s v -l verbose -a "(__fish_print_magento_verbosity_levels)" -d "Increase the verbosity of messages: 1 for normal output, 2 for more verbose output and 3 for debug";

#
# admin:user:unlock
#
__fish_magento_register_command_option admin:user:unlock -f -a "(__fish_print_magento_users)" -d "The admin username to unlock";

#
# cache:clean
#
__fish_magento_register_command_option cache:clean -f -a "(__fish_print_magento_cache_types)" -d "Space-separated list of cache types or omit to apply to all cache types.";
__fish_magento_register_command_option cache:clean -f -l bootstrap -d "add or override parameters of the bootstrap";

#
# cache:enable
#
__fish_magento_register_command_option cache:enable -f -a "(__fish_print_magento_cache_types)" -d "Space-separated list of cache types or omit to apply to all cache types.";
__fish_magento_register_command_option cache:enable -f -l bootstrap -d "add or override parameters of the bootstrap";

#
# cache:disable
#
__fish_magento_register_command_option cache:disable -f -a "(__fish_print_magento_cache_types)" -d "Space-separated list of cache types or omit to apply to all cache types.";
__fish_magento_register_command_option cache:disable -f -l bootstrap -d "add or override parameters of the bootstrap";

#
# cache:status
#
__fish_magento_register_command_option cache:status -f -l bootstrap -d "add or override parameters of the bootstrap";

#
# cron:run
#
__fish_magento_register_command_option cron:run -f -l group -a "TODO" -d "Run jobs only from specified group";
__fish_magento_register_command_option cron:run -f -l bootstrap -d "add or override parameters of the bootstrap";

#
# deploy:mode:set
#
__fish_magento_register_command_option deploy:mode:set -f -a "(__fish_print_magento_deploy_modes)" -d 'The application mode to set. Available options are "developer" or "production"';
__fish_magento_register_command_option deploy:mode:set -f -s s -l skip-compilation -d "Skips the clearing and regeneration of static content (generated code, preprocessed CSS, and assets in pub/static/)";

#
# dev:source-theme:deploy
#
__fish_magento_register_command_option dev:source-theme:deploy -f -a "" -d 'Files to pre-process (file should be specified without extension) (default: ["css/styles-m","css/styles-l"])';
__fish_magento_register_command_option dev:source-theme:deploy -f -l type -a "(__fish_print_magento_source_theme_file_types)" -d 'Type of source files (default: "less")';
__fish_magento_register_command_option dev:source-theme:deploy -f -l locale -a "(__fish_print_magento_languages)" -d 'Locale (default: "en_US")';
__fish_magento_register_command_option dev:source-theme:deploy -f -l area -a "(__fish_print_magento_theme_areas)" -d 'Area (default: "frontend")';
__fish_magento_register_command_option dev:source-theme:deploy -l theme -a "(__fish_print_magento_themes)" -d 'Theme [Vendor/theme] (default: "Magento/luma")';

#
# dev:tests:run
#
__fish_magento_register_command_option dev:tests:run -f -a "(__fish_print_magento_available_tests)" -d 'Type of test to run (default: "default")';

#
# dev:urn-catalog:generate
#
__fish_magento_register_command_option dev:urn-catalog:generate -f -l ide -a "(__fish_print_magento_available_ides)" -d 'Format in which catalog will be generated. Supported: [phpstorm] (default: "phpstorm")';

#
# dev:xml:convert
#
__fish_magento_register_command_option dev:xml:convert -s o -l overwrite -d 'Overwrite XML file';

#
# i18n:collect-phrases
#
__fish_magento_register_command_option i18n:collect-phrases -s o -l output -d 'Path (including filename) to an output file. With no file specified, defaults to stdout.';
__fish_magento_register_command_option i18n:collect-phrases -f -s m -l magento -d 'Use the --magento parameter to parse the current Magento codebase. Omit the parameter if a directory is specified.';

#
# i18n:pack
#
__fish_magento_register_command_option i18n:pack -f -s m -l mode -a "(__fish_print_magento_i18n_packing_modes)" -d 'Save mode for dictionary (default: "replace")';
__fish_magento_register_command_option i18n:pack -s d -l allow-duplicates -d 'Use the --allow-duplicates parameter to allow saving duplicates of translate. Otherwise omit the parameter.';

#
# i18n:uninstall
#
__fish_magento_register_command_option i18n:uninstall -f -s b -l backup-code -d 'Take code and configuration files backup (excluding temporary files)';
__fish_magento_register_command_option i18n:uninstall -f -a "(__fish_print_magento_languages)" -d 'Language package name';

#
# indexer:reindex
#
__fish_magento_register_command_option indexer:reindex -f -a "(__fish_print_magento_indexer_names)" -d 'Space-separated list of index types or omit to apply to all indexes.';

#
# indexer:reset
#
__fish_magento_register_command_option indexer:reset -f -a "(__fish_print_magento_indexer_names)" -d 'Space-separated list of index types or omit to apply to all indexes.';

#
# indexer:set-mode
#
__fish_magento_register_command_option indexer:set-mode -f -a "(__fish_print_magento_indexer_names)" -d "Space-separated list of index types or omit to apply to all indexes.";

#
# indexer:show-mode
#
__fish_magento_register_command_option indexer:show-mode -f -a "(__fish_print_magento_indexer_names)" -d "Space-separated list of index types or omit to apply to all indexes.";

# 
# indexer:status
#
__fish_magento_register_command_option indexer:status -f -a "(__fish_print_magento_indexer_names)" -d "Space-separated list of index types or omit to apply to all indexes.";

# 
# info:dependencies:show-framework
#
__fish_magento_register_command_option info:dependencies:show-framework -f -s o -l output  -d 'Report filename (default: "framework-dependencies.csv")';

#
# info:dependencies:show-modules
#
__fish_magento_register_command_option info:dependencies:show-modules -f -s o -l output  -d 'Report filename (default: "modules-dependencies.csv")';

#
# info:dependencies:show-modules-circular
#
__fish_magento_register_command_option info:dependencies:show-modules-circular -f -s o -l output  -d 'Report filename (default: "modules-circular-dependencies.csv")';

#
# maintenance:allow-ips
#
__fish_magento_register_command_option maintenance:allow-ips -l none -d 'Clear allowed IP addresses';

#
# maintenance:disable
#
__fish_magento_register_command_option maintenance:disable -l ip -d "Allowed IP addresses (use 'none' to clear allowed IP list) (multiple values allowed)";

#
# maintenance:enable  
# 
__fish_magento_register_command_option maintenance:enable -l ip -d "Allowed IP addresses (use 'none' to clear allowed IP list) (multiple values allowed)";

#
# module:disable
#
__fish_magento_register_command_option module:disable -f -a "(__fish_print_magento_modules)" -d "Name of the module";
__fish_magento_register_command_option module:disable -s f -l force                -d "Bypass dependencies check";
__fish_magento_register_command_option module:disable      -l all                  -d "Disable all modules";
__fish_magento_register_command_option module:disable -s c -l clear-static-content -d "Clear generated static view files. Necessary, if the module(s) have static view files";

#
# module:enable
# 
__fish_magento_register_command_option module:enable -f -a "(__fish_print_magento_modules)" -d "Name of the module";
__fish_magento_register_command_option module:enable -f -s f -l force                -d "Bypass dependencies check";
__fish_magento_register_command_option module:enable -f      -l all                  -d "Enable all modules";
__fish_magento_register_command_option module:enable -f -s c -l clear-static-content -d "Clear generated static view files. Necessary, if the module(s) have static view files";

#
# module:uninstall
#
__fish_magento_register_command_option module:uninstall -f -a "(__fish_print_magento_modules)" -d "Name of the module";
__fish_magento_register_command_option module:uninstall -f -s r -l remove-data  -d "Remove data installed by module(s)";
__fish_magento_register_command_option module:uninstall -f      -l backup-code  -d "Take code and configuration files backup (excluding temporary files)";
__fish_magento_register_command_option module:uninstall -f      -l backup-media -d "Take media backup";
__fish_magento_register_command_option module:uninstall -f      -l backup-db    -d "Take complete database backup";
__fish_magento_register_command_option module:uninstall -f -s c -l clear-static-content -d "Clear generated static view files. Necessary, if the module(s) have static view files";

#
# setup:backup
#
__fish_magento_register_command_option setup:backup -f -l code  -d "Take code and configuration files backup (excluding temporary files)";
__fish_magento_register_command_option setup:backup -f -l media -d "Take media backup";
__fish_magento_register_command_option setup:backup -f -l db    -d "Take complete database backup";

#
# setup:config:set
#
__fish_magento_register_command_option setup:config:set -f -l backend-frontname -d "Backend frontname (will be autogenerated if missing)";
__fish_magento_register_command_option setup:config:set -f -l key -d "Encryption key";
__fish_magento_register_command_option setup:config:set -f -l session-save -d "Session save handler";
__fish_magento_register_command_option setup:config:set -f -l definition-format -d "Type of definitions used by Object Manager"
__fish_magento_register_command_option setup:config:set -f -l db-host -d "Database server host";
__fish_magento_register_command_option setup:config:set -f -l db-name -d "Database name" -a "(__fish_print_magento_mysql_databases)";
__fish_magento_register_command_option setup:config:set -f -l db-user -d "Database server username" -a "(__fish_print_magento_mysql_users)";
__fish_magento_register_command_option setup:config:set -f -l db-engine -d "Database server engine" -a "(__fish_print_magento_mysql_engines)";
__fish_magento_register_command_option setup:config:set -f -l db-password -d "Database server password";
__fish_magento_register_command_option setup:config:set -f -l db-prefix -d "Database table prefix";
__fish_magento_register_command_option setup:config:set -f -l db-model -d "Database type";
__fish_magento_register_command_option setup:config:set -f -l db-init-statements -d "Database initial set of commands";
__fish_magento_register_command_option setup:config:set -f -l skip-db-validation -s s -d "If specified, then db connection validation will be skipped";
__fish_magento_register_command_option setup:config:set -f -l http-cache-hosts -d "http Cache hosts";

#
# setup:install
#
__fish_magento_register_command_option setup:install -f -l backend-frontname -d "Backend frontname (will be autogenerated if missing)";
__fish_magento_register_command_option setup:install -f -l key -d "Encryption key";
__fish_magento_register_command_option setup:install -f -l session-save -d "Session save handler";
__fish_magento_register_command_option setup:install -f -l definition-format -d "Type of definitions used by Object Manager"
__fish_magento_register_command_option setup:install -f -l db-host -d "Database server host";
__fish_magento_register_command_option setup:install -f -l db-name -d "Database name" -a "(__fish_print_magento_mysql_databases)";
__fish_magento_register_command_option setup:install -f -l db-user -d "Database server username" -a "(__fish_print_magento_mysql_users)";
__fish_magento_register_command_option setup:install -f -l db-engine -d "Database server engine" -a "(__fish_print_magento_mysql_engines)";
__fish_magento_register_command_option setup:install -f -l db-password -d "Database server password";
__fish_magento_register_command_option setup:install -f -l db-prefix -d "Database table prefix";
__fish_magento_register_command_option setup:install -f -l db-model -d "Database type";
__fish_magento_register_command_option setup:install -f -l db-init-statements -d "Database initial set of commands";
__fish_magento_register_command_option setup:install -f -l skip-db-validation -s s -d "If specified, then db connection validation will be skipped";
__fish_magento_register_command_option setup:install -f -l http-cache-hosts -d "http Cache hosts";
__fish_magento_register_command_option setup:install -f -l base-url -a "(__fish_print_magento_url_protocols)" -d "URL the store is supposed to be available at";
__fish_magento_register_command_option setup:install -f -l language -a "(__fish_print_magento_languages)" -d "Default language code";
__fish_magento_register_command_option setup:install -f -l timezone -d "Default time zone code";
__fish_magento_register_command_option setup:install -f -l currency -d "Default currency code";
__fish_magento_register_command_option setup:install -f -l use-rewrites -d "Use rewrites";
__fish_magento_register_command_option setup:install -f -l use-secure -d "Use secure URLs. Enable this option only if SSL is available.";
__fish_magento_register_command_option setup:install -f -l base-url-secure -a "https://" -d "Base URL for SSL connection";
__fish_magento_register_command_option setup:install -f -l use-secure-admin -d "Run admin interface with SSL";
__fish_magento_register_command_option setup:install -f -l admin-use-security-key -d 'Whether to use a "security key" feature in Magento Admin URLs and forms';
__fish_magento_register_command_option setup:install -f -r -l admin-user          -d "(Required) Admin user";
__fish_magento_register_command_option setup:install -f -r -l admin-password      -d "(Required) Admin password";
__fish_magento_register_command_option setup:install -f -r -l admin-email         -d "(Required) Admin email";
__fish_magento_register_command_option setup:install -f -r -l admin-firstname     -d "(Required) Admin first name";
__fish_magento_register_command_option setup:install -f -r -l admin-lastname      -d "(Required) Admin last name";
__fish_magento_register_command_option setup:install -f -l cleanup-database -d "Cleanup the database before installation";
__fish_magento_register_command_option setup:install -f -l sales-order-increment-prefix -d "Sales order number prefix";
__fish_magento_register_command_option setup:install -f -l use-sample-data -d "Use sample data";

#
# setup:performance:generate-fixtures
#
__fish_magento_register_command_option setup:performance:generate-fixtures -f -s s -l skip-reindex -d "Skip reindex";

#
# setup:rollback
#
__fish_magento_register_command_option setup:rollback -s c -l code-file -d "Basename of the code backup file in var/backups";
__fish_magento_register_command_option setup:rollback -s m -l media-file -d "Basename of the media backup file in var/backups";
__fish_magento_register_command_option setup:rollback -s d -l db-file -d "Basename of the db backup file in var/backups";

#
# setup:static-content:deploy
#
__fish_magento_register_command_option setup:static-content:deploy -x -a "(__fish_print_magento_languages)" -d "Space-separated list of ISO-636 language codes for which to output static view files.";
__fish_magento_register_command_option setup:static-content:deploy -f -s d -l dry-run -d "If specified, then no files will be actually deployed.";
__fish_magento_register_command_option setup:static-content:deploy -f -l no-javascript -d "Do not deploy JavaScript files"; 
__fish_magento_register_command_option setup:static-content:deploy -f -l no-css -d "Do not deploy CSS files.";
__fish_magento_register_command_option setup:static-content:deploy -f -l no-less -d "Do not deploy LESS files." 
__fish_magento_register_command_option setup:static-content:deploy -f -l no-images -d "Do not deploy images.";
__fish_magento_register_command_option setup:static-content:deploy -f -l no-fonts -d "Do not deploy font files." 
__fish_magento_register_command_option setup:static-content:deploy -f -l no-html -d "Do not deploy HTML files." 
__fish_magento_register_command_option setup:static-content:deploy -f -l no-misc -d "Do not deploy other types of files (.md, .jbf, .csv, etc...).";
__fish_magento_register_command_option setup:static-content:deploy -f -l no-html-minify -d "Do not minify HTML files.";
__fish_magento_register_command_option setup:static-content:deploy -s t -l theme -d 'Generate static view files for only the specified themes. (default: ["all"]) (multiple values allowed)';
__fish_magento_register_command_option setup:static-content:deploy -l exclude-theme -d 'Do not generate files for the specified themes. (default: ["none"]) (multiple values allowed)';
__fish_magento_register_command_option setup:static-content:deploy -f -s l -l language -d 'Generate files only for the specified languages. (default: ["all"]) (multiple values allowed)';
__fish_magento_register_command_option setup:static-content:deploy -f -l exclude-language -d 'Do not generate files for the specified languages. (default: ["none"]) (multiple values allowed)';
__fish_magento_register_command_option setup:static-content:deploy -f -s a -l area -a "(__fish_print_magento_theme_areas)" -d 'Generate files only for the specified areas. (default: ["all"]) (multiple values allowed)';
__fish_magento_register_command_option setup:static-content:deploy -f -l exclude-area -a "(__fish_print_magento_theme_areas)" -d 'Do not generate files for the specified areas. (default: ["none"]) (multiple values allowed)';
__fish_magento_register_command_option setup:static-content:deploy -x -s j -l jobs -d "Enable parallel processing using the specified number of jobs. (default: 4)";
__fish_magento_register_command_option setup:static-content:deploy -f -l symlink-locale -d "Create symlinks for the files of those locales, which are passed for deployment, but have no customizations";


#
# setup:store-config:set
#
__fish_magento_register_command_option setup:store-config:set -f -l base-url -a "(__fish_print_magento_url_protocols)" -d "URL the store is supposed to be available at";
__fish_magento_register_command_option setup:store-config:set -f -l language -a "(__fish_print_magento_languages)" -d "Default language code";
__fish_magento_register_command_option setup:store-config:set -f -l timezone -d "Default time zone code";
__fish_magento_register_command_option setup:store-config:set -f -l currency -d "Default currency code";
__fish_magento_register_command_option setup:store-config:set -f -l use-rewrites -d "Use rewrites";
__fish_magento_register_command_option setup:store-config:set -f -l use-secure -d "Use secure URLs. Enable this option only if SSL is available.";
__fish_magento_register_command_option setup:store-config:set -f -l base-url-secure -a "https://" -d "Base URL for SSL connection";
__fish_magento_register_command_option setup:store-config:set -f -l use-secure-admin -d "Run admin interface with SSL";
__fish_magento_register_command_option setup:store-config:set -f -l admin-use-security-key -d 'Whether to use a "security key" feature in Magento Admin URLs and forms';

#
# setup:upgrade
#
__fish_magento_register_command_option setup:upgrade -l keep-generated -d "Prevents generated files from being deleted. ";

#
# theme:uninstall
#
__fish_magento_register_command_option theme:uninstall -f      -l backup-code -d "Take code backup (excluding temporary files)";
__fish_magento_register_command_option theme:uninstall -f -s c -l clear-static-content -d "Clear generated static view files.";