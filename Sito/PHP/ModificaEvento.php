<?php

require_once ('Controller/LoginController.php');
require_once ('Controller/EventsController.php');
require_once ('Utilities/DateUtilities.php');

session_start();

if (!LoginController::isAuthenticatedUser() || !LoginController::isAdminUser() || !isset($_GET['id'])) {
    header('Location: Errore.php');
}

$message = '';
$eventsController = new EventsController();
$event = $eventsController->getEvent($_GET['id']);

$title = $event['Titolo'];
$description = $event['Descrizione'];
$type = $event['Tipologia'];
$begin_date = DateUtilities::englishItalianDate($event['DataInizio']);
$end_date = DateUtilities::englishItalianDate($event['DataFine']);
$manager = $event['Organizzatore'];

if (isset($_POST['submit']) && $_POST['submit'] === 'Modifica') {
    $title = $_POST['title'];
    $description = $_POST['description'];
    $begin_date = DateUtilities::englishItalianDate($_POST['beginDate']);
    $end_date = DateUtilities::englishItalianDate($_POST['endDate']);
    $type = $_POST['type'];
    $manager = $_POST['manager'];
    $message = $eventsController->updateEvent($_GET['id'], $title, $description, $begin_date, $end_date, $type, $manager, $_SESSION['username']);
    unset($eventsController);
    if($message === '') {
        $_SESSION['event_title'] = $_POST['title'];
        $_SESSION['event_id'] = $_GET['id'];
        header('Location: EventoModificato.php');
    }
}

$exhibition_type = ' ';
$conference_type = ' ';

if ($type === 'Mostra') {
    $exhibition_type = ' selected="selected" ';
} else {
    $conference_type = ' selected="selected" ';
}

$breadcrumbs = '';
if (isset($_SESSION['contentPage'])) {
    $breadcrumbs .= '?page=' . $_SESSION['contentPage'];
    if (isset($_SESSION['filter_content'])) {
        $breadcrumbs .= '&amp;filterContent='  . $_SESSION['filter_content'];
        if (isset($_SESSION['filter_content_type'])) {
            $breadcrumbs .= '&amp;filterContentType='  . $_SESSION['filter_content_type'];
        } else {
            $breadcrumbs .= '&amp;filterContentType=NessunFiltro';
        }
    } else {
        $breadcrumbs .= '&amp;filterContent=NessunFiltro';
    }
} else {
    $breadcrumbs .= '?page=1';
}

$document = file_get_contents('../HTML/ModificaEvento.html');
$login = LoginController::getAuthenticationMenu();

$document = str_replace("<span id='loginMenuPlaceholder'/>", $login, $document);
$document = str_replace("<span id='breadcrumbsPlaceholder'/>", $breadcrumbs, $document);
$document = str_replace("<span id='outputMessagePlaceholder'/>", $message, $document);
$document = str_replace("<span id='titleValuePlaceholder'/>", $title, $document);
$document = str_replace("<span id='descriptionValuePlaceholder'/>", $description, $document);
$document = str_replace("<span id='exhibitionTypeSelectedPlaceholder'/>", $exhibition_type, $document);
$document = str_replace("<span id='conferenceTypeSelectedPlaceholder'/>", $conference_type, $document);
$document = str_replace("<span id='beginDateValuePlaceholder'/>", $begin_date, $document);
$document = str_replace("<span id='endDateValuePlaceholder'/>", $end_date, $document);
$document = str_replace("<span id='managerValuePlaceholder'/>", $manager, $document);

echo $document;

?>