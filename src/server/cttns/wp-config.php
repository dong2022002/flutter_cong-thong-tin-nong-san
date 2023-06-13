<?php

/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'cttns');

/** Database username */
define('DB_USER', 'cttns');

/** Database password */
define('DB_PASSWORD', '');

/** Database hostname */
define('DB_HOST', 'localhost');

/** Database charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The database collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'k=8*b@t(?c-4HP/|}eUTKy7ph=asBW/$x_6[@r@1wEu(RfZUewpdD,|:0~FQz`!@');
define('SECURE_AUTH_KEY',  '*(7AD[ImOn5/MUWn!C+-[0eyQ%6%|GIdRLSA+2h@aWMBIcLF6:,P&s/+#@v&ia(u');
define('LOGGED_IN_KEY',    'wy&m0![&ev8S@]Q :_uwY0t}IJuzMRoMH/E:*LDH<b1sQc-wXnZ$Uv*BsClM`H>7');
define('NONCE_KEY',        '+qh{U6_XDtVsVLq,F0lu6PwUqMb9edz?Vj{h.J$1M[NTDsqg-[=!#hGY%~ydVl0Z');
define('AUTH_SALT',        '),o^LE2^|vjN6pMBP.A(xe?f]Kz8*dV*=T=0a1}m+$_lbwB|DW.>FzTho>b(B)|k');
define('SECURE_AUTH_SALT', '2h<?SD`1NK+4OJ(,bh.2GluCsOKm9=Z4yD/CgNS0S=O#I KEo{w !Gf*^i,PKY7v');
define('LOGGED_IN_SALT',   'tHG4uHw-!MTfj#{6aDH#i u};^yV4hF,QPmMYsX{(ZzzGEaF%:</[>p!|@yTe%T4');
define('NONCE_SALT',       '%~vNt#US(;#VidEipBigD7(ZP|L2F2R.s7MF;X)cKHxH%x)m`lfC4~:lKad;J0@A');

define('JWT_AUTH_SECRET_KEY', '&:/GNH]Zu0s*-cK1x@>S %-V70}RwOaff6aXtFl5gJ!d;!8AzrjY8f5!qcL#i8ux');
/**#@-*/
define('JWT_AUTH_CORS_ENABLE', true);
/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define('WP_DEBUG', false);

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if (!defined('ABSPATH')) {
	define('ABSPATH', __DIR__ . '/');
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
