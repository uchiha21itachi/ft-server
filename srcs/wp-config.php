<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'WordPress' );

/** MySQL database username */
define( 'DB_USER', 'WordPressUser' );

/** MySQL database password */
define( 'DB_PASSWORD', '1234' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */

define('AUTH_KEY',         'Q+r^NVFKnqR>.7qKh=XV1.w|R`(^TI%}0qzDvp@>[OZ(#iWRPPhZ5_^fgG_=[>=-');
define('SECURE_AUTH_KEY',  'z2*u]Hwr|enx}s+qX0|f@+9YA&cYuhe7}T8`{zDCrb}*w>CrQxGKi7k;la!_P#uO');
define('LOGGED_IN_KEY',    'WHZbDf5,O_ |iD3ewcVAeZN8|#[z|Y!L-|UN|1GzdR9Ud1mDb2i-!?/.;^p+,D{@');
define('NONCE_KEY',        '$7Y7J[YylGfOP/(o(tqRrqbs~i9r6Zj-g94za?-:i1c<c|prsx(^m#N-|SRZ[l(0');
define('AUTH_SALT',        '9(3}:?od|PAs(1|B6g2 6af=Hi&w/;V)4L8*|ojBRq6cV:FN;`14|AhWcCehvT~7');
define('SECURE_AUTH_SALT', '$W;}RI=(}}<#K_T@C}Q~fTd^i7nYz#w2`pd<U[j5Y6>N:?vV_q6C.,UOEK#b,6f)');
define('LOGGED_IN_SALT',   'rOcEvbQ-0-REVVy.rLG_Hy%FfKM_`nC@kxM6BqySRf*f?&jl&t!sghk<K2 5yYVx');
define('NONCE_SALT',       'f/n@Gxi_F0MxBD3^2#F+e$@-vAX_|O]2^h+4nSIeIK}+b55NV!^|q6nB;jQW[5XN');

/**#@-*/

/**
 * WordPress Database Table prefix.
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
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
