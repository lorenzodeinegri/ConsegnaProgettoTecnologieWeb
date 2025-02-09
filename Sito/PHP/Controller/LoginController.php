<?php

class LoginController {
    public static function getAuthenticationMenu($isNotUserArea = true) {
        if (isset($_SESSION['username'])) {
            if($isNotUserArea) {
                $login = '<div id="loginMenu">
                        <ul class="list">
                            <li>
                                <a id="areaPersonale" class="button" href="AreaPersonale.php" title="Vai alla pagina dell\'area personale" role="button" aria-label="Vai alla pagina dell\'area personale" rel="nofollow">
                                    Area personale
                                </a>
                            </li>
                            <li>
                                <a id="logout" class="button" href="Logout.php" title="Esci dal tuo profilo" role="button" aria-label="Esci dal tuo profilo" xml:lang="en">
                                    Logout
                                </a>
                            </li>
                        </ul>
                      </div>';
            } else {
                $login = '<div id="loginMenu">
                            <a id="logout" class="button" href="Logout.php" title="Esci dal tuo profilo" role="button" aria-label="Esci dal tuo profilo" xml:lang="en">
                                Logout
                            </a>
                          </div>';
            }
        } else {
            $login = '<div id="loginMenu">
                        <a id="loginButton" class="button" href="Login.php" title="Vai alla pagina di login" role="button" aria-label="Vai alla pagina di login" xml:lang="en">
                            Login
                        </a>
                      </div>';
        }

        return $login;
    }

    public static function isAuthenticatedUser() {
        return isset($_SESSION['username']);
    }

    public static function isAdminUser() {
        return isset($_SESSION['admin']) && $_SESSION['admin'] === 1;
    }
}

?>
