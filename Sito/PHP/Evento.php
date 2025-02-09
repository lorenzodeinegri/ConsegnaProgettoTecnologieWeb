<?php

session_start();

if (!isset($_GET['id'])) {
    header('Location: Errore.php');
}

require_once ('Controller/LoginController.php');
require_once ('Utilities/DateUtilities.php');
require_once ('Utilities/InputCheckUtilities.php');

$document = file_get_contents('../HTML/Evento.html');

require_once ('Controller/EventsController.php');
$controller = new EventsController();

$login = LoginController::getAuthenticationMenu();

$event = $controller->getEvent($_GET['id']);

unset($controller);

$event_title = InputCheckUtilities::prepareStringForDisplay($event['Titolo']);
$event_type = InputCheckUtilities::prepareStringForDisplay($event['Tipologia']);
$event_begin_date = DateUtilities::englishItalianDate($event['DataInizio']);
$event_end_date = DateUtilities::englishItalianDate($event['DataFine']);
$event_manager = InputCheckUtilities::prepareStringForDisplay($event['Organizzatore']);
$event_description = InputCheckUtilities::prepareStringForDisplay($event['Descrizione']);
$breadcrumbs = '';
$searchText = '';
$searchFilterOpera = 'selected="selected" ';
$searchFilterEvento = '';
if (isset($_SESSION['previous_page'])) {
    if ($_SESSION['previous_page'] === 'GestioneContenuti') {
        $page = 'page=' . $_SESSION['contentPage'];
        $filter_content = 'filterContent=' . $_SESSION['filter_content'];
        $filter_content_type = 'filterContentType=' . $_SESSION['filter_content_type'];
        $breadcrumbs = '<a href="AreaPersonale.php" title="Vai alla pagina dell\'area personale" aria-label="Vai alla pagina dell\'area personale" rel="nofollow">Area personale</a>
                    &gt;&gt; <a href="GestioneContenuti.php?' . $page . '&amp;' . $filter_content . '&amp;' . $filter_content_type . '" title="Vai alla pagina di gestione dei contenuti" aria-label="Vai alla pagina di gestione dei contenuti" rel="nofollow">Gestione contenuti</a>';
    } else if ($_SESSION['previous_page'] === 'Eventi') {
        $page = 'page=' . $_SESSION['event_page'];
        $filter_event_type = 'filterType=' . $_SESSION['filter_event_type'];
        $breadcrumbs = '<a href="Eventi.php?' . $page . '&amp;' . $filter_event_type . '" title="Vai alla pagina Eventi" aria-label="Vai alla pagina Eventi">Eventi</a>';
    } elseif ($_SESSION['previous_page'] === 'RicercaEventi') {
        $searchText = $_SESSION['search_event_string'];
        $searchFilterEvento = 'selected="selected" ';
        $searchFilterOpera = '';
        $search = 'search=' . $_SESSION['search_event_string'];
        $page = 'page=' . $_SESSION['search_event_page'];
        $breadcrumbs = '<a href="RicercaEventi.php?' . $search . '&amp;' . $page . '" title="Vai alla pagina di ricerca degli eventi" aria-label="Vai alla pagina di ricerca degli eventi">Ricerca Eventi</a>';
    }
} else {
    $breadcrumbs = '<a href="Eventi.php?page=1&amp;filterType=NessunFiltro" title="Vai alla pagina Eventi" aria-label="Vai alla pagina Eventi">Eventi</a>';
}

$document = str_replace("<span id='titlePlaceholder'/>", $event_title, $document);
$document = str_replace("<span id='searchTextPlaceholder'/>", $searchText, $document);
$document = str_replace("<span id='searchFilterOperaPlaceholder'/>", $searchFilterOpera, $document);
$document = str_replace("<span id='searchFilterEventoPlaceholder'/>", $searchFilterEvento, $document);
$document = str_replace("<span id='breadcrumbsPlaceholder'/>", $breadcrumbs, $document);
$document = str_replace("<span id='loginMenuPlaceholder'/>", $login, $document);
$document = str_replace("<span id='eventTypePlaceholder'/>", $event_type, $document);
$document = str_replace("<span id='eventBeginDatePlaceholder'/>", $event_begin_date, $document);
$document = str_replace("<span id='eventEndDatePlaceholder'/>", $event_end_date, $document);
$document = str_replace("<span id='eventManagerPlaceholder'/>", $event_manager, $document);
$document = str_replace("<span id='eventDescriptionPlaceholder'/>", $event_description, $document);

echo $document;

?>
