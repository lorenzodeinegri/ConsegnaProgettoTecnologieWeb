-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 08, 2020 at 10:08 AM
-- Server version: 10.1.44-MariaDB-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ldeinegr`
--
CREATE DATABASE IF NOT EXISTS `ldeinegr` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ldeinegr`;

-- --------------------------------------------------------

--
-- Table structure for table `Eventi`
--

CREATE TABLE IF NOT EXISTS `Eventi` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Titolo` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `Descrizione` text COLLATE utf8_bin NOT NULL,
  `DataInizio` date NOT NULL,
  `DataFine` date NOT NULL,
  `Tipologia` enum('Mostra','Conferenza') COLLATE utf8_bin NOT NULL,
  `Organizzatore` varchar(64) COLLATE utf8_bin NOT NULL,
  `Utente` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Utente_Evento` (`Utente`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `Eventi`
--

INSERT INTO `Eventi` (`ID`, `Titolo`, `Descrizione`, `DataInizio`, `DataFine`, `Tipologia`, `Organizzatore`, `Utente`) VALUES
(13, 'Messaggeri dell\'ignoto', 'Un percorso alla scoperta degli angeli, dei dèmoni e di tutte le altre creature soprannaturali che, nell\'arte figurativa, hanno espresso l\'idea di messaggeri dell\'eterno, dell\'ignoto e del misterioso e affascianto gli artisti nei secoli.', '2020-06-20', '2020-10-20', 'Mostra', 'Comune di Padova', 'admin'),
(14, 'Il significato della luce tra Cinquecento e Seicento', 'Un\'analisi critica del mutevole ruolo della luce tra Cinquecento e Seicento, attraverso lo studio minuzioso di opere pittoriche e scultoree rappresentative delle due epoche.', '2020-09-10', '2020-12-10', 'Conferenza', 'Università di Padova', 'admin'),
(15, 'Volto di fanciullo', 'Una raccolta di giovinetti, bimbi, neonati, garzoni, ragazzacci, fanciulle, bambine, ometti e giovani donne, un viaggio alla scoperta delle storie scritte nei tratti del loro viso, nei loro occhi e nelle pieghe del loro volto.', '2020-08-11', '2021-02-11', 'Mostra', 'Fondazione SalvaInfanzia Padova', 'admin'),
(16, 'Onirio', 'Una raccolta di dipinti e sculture dedicate ai fantasiosi proditti della mente umana durante il sonno. Il percorso toccherà paesaggi idilliaci, fiabeschi e paradisiaci, ma anche oscuri e macabri scenari da incubo.', '2021-01-02', '2021-07-02', 'Mostra', 'TecArt', 'admin'),
(17, 'Leonardo e la natura', 'Analisi critica dell\'evoluzione della natura nell\'opera di Leonardo da Vinci e contestualizzazione nel periodo storico.', '2020-06-23', '2020-06-25', 'Conferenza', 'Associazione italiana Da Vinci', 'admin'),
(18, 'Dinamismi', 'Come si è voluto rappresentare il movimento nella scultura negli ultimi secoli? Come si è passati dai volumi tondi e armoniosi a quelli scattanti e irregolari? Un percorso studiato per mostrare tutte le sfaccettature della rappresentazione di questo tema.', '2020-08-04', '2020-12-10', 'Mostra', 'Pinacoteca civica Padova', 'admin'),
(19, 'I banchetti nell\'Ottocento', 'Analisi delle abitudini alimentari dell\'epoca attraverso i dipinti più famosi.', '2021-01-31', '2021-02-05', 'Conferenza', 'Consorzio ristoratori Padova', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `Opere`
--

CREATE TABLE IF NOT EXISTS `Opere` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Autore` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Titolo` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `Descrizione` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Datazione` int(4) NOT NULL,
  `Stile` enum('Dipinto','Scultura') CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Tecnica` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Materiale` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Dimensioni` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Prestito` tinyint(1) NOT NULL,
  `Immagine` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `Utente` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Utente_Opera` (`Utente`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Opere`
--

INSERT INTO `Opere` (`ID`, `Autore`, `Titolo`, `Descrizione`, `Datazione`, `Stile`, `Tecnica`, `Materiale`, `Dimensioni`, `Prestito`, `Immagine`, `Utente`) VALUES
(36, '[fr]Etiene Maurice Falconet[/fr]', 'Amore minacciante', '[fr]Falconet[/fr] produsse un Cupido per la \"[fr]mansion[/fr]\" a Parigi della Marchesa [fr]Pompadour[/fr], signora di Luigi XV. Riscosse grande successo, richiamando l\'attenzione dei collezionisti, ed infatti molte copie furono commissionate allo scultore. La lieve inclinazione della testa riccioluta, e il penetrante e minaccioso sorriso sono realizzati con un trattamente virtuosistico del marmo: con la morbidezza del corpo del fanciullo e con la leggerezza delle piume delle ali, lo scultore riesce a trasformare il freddo marmo in una vera creatura vivente.', 1757, 'Scultura', NULL, 'Marmo bianco', '185 x 68', 0, 'Images/Uploaded/cef76e96b2096e36439699f5e68fd9bafc966deb.jpeg', 'admin'),
(37, 'Antonio Canal detto il Canaletto', 'Il bacino di San Marco verso est', 'Tiepolo illustra l’episodio leggendario in cui Cleopatra, per stupire Antonio con il lusso e la regalità della sua corte, sciolse una perla preziosissima in un bicchiere di aceto: attorno al gesto di Cleopatra si concentra l’attenzione dei presenti. Tiepolo inserì anche il proprio ritratto fra i personaggi della corte. La piccola figura del nano, di spalle, che sale i gradini verso il tavolo del banchetto, crea una continuità fra lo spazio dello spettatore e la scena rappresentata sulla parete della sala. La regina egiziana ha il volto della nobile veneziana Maria Labia, padrona di casa.', 1735, 'Dipinto', 'Olio su tela', NULL, '125 x 204', 0, 'Images/Uploaded/02232b71ee67d85da457d63600bf7248c3d6af8b.jpeg', 'admin'),
(38, 'Gianbattista Tiepolo', 'Banchetto di Antonio e Cleopatra', 'Tiepolo illustra l\'episodio leggendario in cui Cleopatra, per stupire Antonio con il lusso e la regalità della sua corte, sciolse una perla preziosissima in un bicchiere di aceto: attorno al gesto di Cleopatra si concentra l’attenzione dei presenti. Tiepolo inserì anche il proprio ritratto fra i personaggi della corte. La piccola figura del nano, di spalle, che sale i gradini verso il tavolo del banchetto, crea una continuità fra lo spazio dello spettatore e la scena rappresentata sulla parete della sala. La regina egiziana ha il volto della nobile veneziana Maria Labia, padrona di casa.', 1743, 'Dipinto', 'Olio su tela', NULL, '249 x 346', 0, 'Images/Uploaded/db49525af02a606678fec4276e5f1a87aa095c63.jpeg', 'admin'),
(39, 'Gian Lorenzo Bernini', 'Apollo e Dafne', 'La scena è spettacolare e terribile al tempo stesso. Apollo è colto nell\'istante in cui sta terminando la sua corsa, resa con un dinamismo sino ad allora sconosciuto alla tradizione scultorea; nel marmo, infatti, il dio è appena riuscito a raggiungere Dafne, e la sfiora leggermente con la mano sinistra, forse con l\'intento di abbracciarla. Apollo, il cui corpo è trattato mettendo anatomicamente in evidenza i muscoli e i tendini tesi per lo sforzo, incede poggiando tutto il peso sul piede destro, saldamente ancorato al suolo, mentre la gamba sinistra è sollevata in alto. Il mantello gli sta scivolando via ed è gonfiato dal vento alle sue spalle; i capelli, organizzati in chiome ondulate e come annodate, sono mossi all\'indietro per via dell\'impeto della corsa e il suo sguardo presenta una vitalità erompente, suggerita dallo spessore delle palpebre, dall\'iride incavato e dalla pupilla in rilievo (che, in questo modo, è l\'unica ad essere colpita dalla luce).\r\n\r\nDafne, per sottrarsi all\'indesiderato abbraccio, ostenta la sua nudità contro il suo volere, e lotta per la sua verginità: per sfuggire alla presa di Apollo, infatti, la ninfa frena all\'improvviso e inarca il busto verso avanti, così da controbilanciare la spinta del dio e proseguire la fuga. La parte inferiore del busto di Dafne, tuttavia, non risponde più alla sua volontà. La metamorfosi, infatti, è appena iniziata: il piede sinistro ha già perso ogni aspetto umano, divenendo radice, e altrettanto sta avvenendo al destro, che la sventurata ninfa tenta invano di sollevare ma che è invece ancorato al suolo da alcune appendici cilindriche che crescono dalle unghie e che formeranno in seguito l\'apparato radicale della pianta di alloro. Per il medesimo processo, la corteccia sta progressivamente avvolgendo il suo leggiadro corpo, mentre le sue mani, rivolte al cielo con i palmi aperti, stanno già diventando ramoscelli d\'alloro. Il volto di Dafne, caratterizzato dalla bocca semiaperta, rivela emozioni contrastanti: terrore, per esser stata appena raggiunta da Apollo, ma anche sollievo, perché è consapevole della metamorfosi appena iniziata e che, pertanto, il padre Peneo è riuscito a esaudire il suo desiderio. Lo sguardo di Apollo, invece, manifesta una dolente, stupefatta delusione.', 1623, 'Scultura', NULL, 'Marmo', '243 x 128', 0, 'Images/Uploaded/e5464438ca71a09a46ed095716014bdcfe4ce7c0.jpeg', 'admin'),
(40, 'Caravaggio', 'Giuditta taglia la testa ad Oloferne', 'In questo quadro Caravaggio rappresenta l\'episodio biblico della decapitazione del condottiero assiro Oloferne da parte della vedova ebrea Giuditta, che voleva salvare il proprio popolo dalla dominazione straniera. Giuditta è raffigurata intenta a decapitare Oloferne con una scimitarra, mentre alla scena assiste una vecchia serva che sorregge con le mani il drappo contenente il cesto nel quale va conservata la testa.\r\n\r\nLo sfondo è scuro, è presente un panneggio rosso in alto a sinistra e una parte minima del letto su cui giace Oloferne. Caravaggio è rimasto fedele al clima dell\'episodio biblico, facendo decapitare il generale con una daga mediorientale, ma ha anche attualizzato la scena, poiché l\'abbigliamento di Giuditta è quello tipico delle donne a lui contemporanee.\r\n\r\nIl pittore fissa l\'acme emotivo nell\'immagine di Oloferne: lo sguardo vitreo farebbe supporre che sia già morto, ma lo spasmo e la tensione dei muscoli indurrebbero a pensare il contrario. Giuditta, invece, sembra adempiere al suo compito con molta riluttanza: le braccia sono tese, come se la donna volesse allontanarsi il più possibile dal corpo di Oloferne, e il suo volto è contratto in un\'espressione mista di fatica e orrore. Accanto a Giuditta Caravaggio ha inserito una serva molto vecchia e brutta, come simbolico contraltare alla bellezza e alla giovinezza della vedova.\r\n\r\nDall\'analisi radiografica si può evincere che in una prima raffigurazione Giuditta era a seni nudi, ma non è chiaro se Caravaggio abbia voluto seguire una tradizione iconografica che vedeva nella nudità un senso di eroismo e di purezza connesso con il sacro  oppure abbia voluto accentuare, in questo modo il carattere provocante, seducente dell\'eroina; aspetto che resta, peraltro anche dopo la raffigurazione del corpetto coprente, probabilmente per cause d\'ordine morale e di autocensura, che mostra comunque, in trasparenza, il seno dell\'eroina, sudato per lo sforzo messo nell\'azione violenta, risultando così ancora più seducente.', 1597, 'Dipinto', 'Olio su tela', NULL, '145 x 195', 0, 'Images/Uploaded/57782cee63878a8fa35e9f49eb402d49c839a483.jpeg', 'admin'),
(41, 'Caravaggio', 'Amor vincit omnia', 'Il dipinto, che prende il titolo e il tema da un passo di Virgilio, era il più famoso della collezione Giustiniani, molto noto e apprezzato. \r\n\r\nSempre nell\'ambito iconografico, la presenza dello scettro fra gli oggetti posati a terra indicherebbe la sovranità Giustiniani sull\'isola di Chio, ceduta dopo l\'assedio turco nel 1566, mentre il globo stellato, ravvisabile appena sotto la coscia di Amore, potrebbe suggerire un rapporto del marchese con l\'astronomia e l\'astrologia. Naturalmente la penna e il libro sono indici simbolici delle qualità letterarie; il compasso e la squadra alluderebbero alle doti di architetto dilettante.\r\n\r\nGli oggetti che vediamo in terra, una armatura, corone d\'alloro, uno spartito musicale, strumenti da carteggio e strumenti musicali, stanno a significare il rifiuto dei piaceri terreni, ma anche i molti interessi del marchese Giustiniani, come indicherebbe la presenza di una V maiuscola stampata sullo spartito. Riguardo agli strumenti musicali Caravaggio ha raffigurato soprattutto una \"natura morta\" raffigurando vari strumenti di fatto inservibili, come il liuto che ha 5 corde e non 12 come di regola, e il violino, che ha 2 corde e non 4.', 1603, 'Dipinto', 'Olio su tela', NULL, '156 x 113', 0, 'Images/Uploaded/a1164284bd138b9bbe7715dcc1f449ffb0b373df.jpeg', 'admin'),
(42, 'Michelangelo', 'Tondo Doni', 'a Sacra Famiglia è composta come un gruppo scultoreo al centro del tondo: la Madonna in primo piano, contrariamente a tutta l\'iconografia antecedente, non ha il Bambino in primo piano, ma si volta per darlo a Giuseppe, che è inginocchiato dietro di lei. Essa, accoccolata a terra, ha appena smesso di leggere il libro che ora è chiuso e abbandonato sul suo manto fra le gambe.\r\n\r\nIl piccolo Gesù gioca con i capelli della mamma, quest’ultima, ha da poco chiuso il libro che stava leggendo (il testo simboleggia probabilmente le profezie legate alla prematura morte di Gesù), per giocare con il piccolo bambino.\r\n\r\nDegna di nota è la torsione di Maria, la quale trasmette un senso di movimento completamente innovativo e che culmina nella testa di Giuseppe; allo stesso modo, una piramide inversa è formata dalle teste e dalle braccia della Sacra Famiglia.\r\n\r\nSpostando lo sguardo in secondo piano, è possibile notare sulla destra il piccolo San Giovanni Battista, mentre ancora più dietro si trovano diversi gruppi di nudi, appoggiati a delle rocce; ad incorniciare questi gruppi c’è un ambiente naturale costituito da un lago, un prato e delle montagne.\r\n\r\nA proposito degli ignudi che si trovano sullo sfondo, facendo bene attenzione, è possibile notare che la muscolatura di quest’ultimi è molto simile a quella del trittico in primo piano. Per rendere ancor più vivace l’intera composizione del Tondo, c’è il netto contrasto tra l’andamento orizzontale in secondo piano e quello verticale della Sacra Famiglia in primo piano.\r\n\r\nIn secondo piano, emergente da una cavità con davanti una sorta di muretto grigio, si vede il piccolo san Giovanni Battista e più lontano una fascia di ignudi appoggiati a un emiciclo di rocce spezzate; sullo sfondo infine si vede un paesaggio definito sinteticamente, con un lago, un prato e montagne che sfumano in lontananza davanti a un cielo azzurrino.\r\n\r\nL\'andamento orizzontale dello sfondo contrasta con la composizione verticale e ascendente delle figure in primo piano, bilanciandola e rendendo più vivace l\'insieme.\r\n\r\nTra le figure in primo piano e gli \"ignudi\" si possono rilevare numerose consonanze figurali: tra la spalla destra di san Giuseppe, prolungata nel braccio di Maria, e l\'omero del nudo retrostante; tra l\'avambraccio legato di Maria e quello del nudo a sinistra, ecc.\r\n\r\nI colori sono audacemente vivaci, luminosi, squillanti, cangianti e \"algidi\". I corpi sono trattati in maniera scultorea, chiaroscurati e spiccati dal fondo della tavola tramite una linea di contorno netta e decisa: del resto, Michelangelo riteneva che la migliore pittura fosse quella che maggiormente si avvicinava alla scultura, cioè quella che possedeva il più elevato grado di plasticità possibile.\r\n\r\nIl punto di vista che Michelangelo scelse per rappresentare gli ignudi è frontale e ribassato, diversamente da quello che adotta per il gruppo centrale, visto dal basso, col muricciolo orizzontale che cela il divario. Si tratta anche di uno sconvolgente superamento dell\'unità prospettica dell\'arte quattrocentesca, segnando un punto di partenza del Manierismo.\r\n\r\nQuesta scelta figurativa, sicuramente voluta, è legata alla volontà, da parte dell\'autore, di conferire monumentalità alla Sacra Famiglia, ma anche di differenziare le zone figurative contrapposte per significato. Molto probabile è che la soluzione prospettiva fosse studiata per adattarsi alla collocazione della tavola: \"il rigore con cui notoriamente si collocavano le opere artistiche nelle dimore fiorentine rafforza l\'eventualità\".', 1504, 'Dipinto', 'Tempera grassa su tavola', NULL, '120 x 120', 0, 'Images/Uploaded/810e499680ec475202e481078dbbf811c6a2cc9e.png', 'admin'),
(43, 'Giambologna', 'Mercurio volante', 'Mercurio è poggiato con il piede sinistro sul vento generato dalla bocca di Zefiro. Il messaggero degli dei sta infatti per spiccare il volo grazie alle ali che si innestano alle caviglie. La gamba destra invece è flessa indietro come il braccio sinistro che regge il caduceo. Il braccio destro è rivolto verso l’alto e anticipa l’ascesa verso il cielo. Sul capo indossa il tradizionale emetto con le ali.\r\n\r\nIl dio ha l’aspetto di un adolescente come rivela il corpo sottile. Il modellato inoltre è molto lontano da quelli michelangioleschi. La loro corporatura atletica e possente lascia il posto ad un fisico sottile e leggero. La posa assunta da Mercurio non comunica impegno muscolare nell’azione. Il dio sembra invece compiere lo slancio verso l’alto con l’agilità della danza.', 1580, 'Scultura', NULL, 'Bronzo', '180 x 53', 1, 'Images/Uploaded/0890efd33c901f698298253e4c4e8ac60135c013.jpeg', 'admin'),
(44, 'Parmiginino', 'Madonna con collo lungo', 'Una tenda rossa scostata fa da sfondo a una slanciata Madonna seduta, rappresentata a tutta figura su un invisibile seggio, con alcuni cuscini imbottiti ai piedi. Sorridente e distante, come una principessa elegante, mostra proporzioni allungate soprattutto evidenti nel collo graziosamente curvato, che dà il nome all\'opera. Ella tiene in grembo il Bambino, addormentato in una posizione un po\' precaria che, con le gambe e le braccia divaricate, sembra sondare la profondità dello spazio attorno a sé. Il Bambino ha un\'età inusualmente avanzata, sui dieci anni, come già nella precedente Madonna della Rosa.\r\n\r\nAnche la composizione adotta soluzioni incomplete, che evitano la tradizionale simmetria nella disposizione del personaggi. A sinistra si assiepano sei angeli, accalcati confusamente in uno spazio ristretto per vedere il bambino. La testa del sesto angelo è incompiuta e difficilmente individuabile: si trova esattamente sotto il gomito destro di Maria. L\'angelo in primo piano, di cui si vede la snella coscia nuda e un\'ala grigia levata, porge a Maria, sfiorandolo con le dita, un vaso d\'argento in cui si riflettono alcuni bagliori, tra cui si distingue un crocifisso: un riferimento all\'Immacolata concezione e all\'appellativo di Maria come \"vaso mistico\", oltre che prefigurazione della Passione per il Bambino che, addormentato, ricorda la posizione delle Pietà. Il velo azzurro intenso non le copre la testa, come al solito, svelando invece una complessa acconciatura con un diadema e file di perle, come se ne vedono anche in altri dipinti di Parmigianino; ricade invece sulla spalla e forma un\'ampia piega dietro la schiena, che bilancia compositivamente il volume delle gambe di Maria.\r\n\r\nLa metà destra è estremamente insolita, anche - ma non solo - per la caratteristica di non finito. È infatti caratterizzata da un\'ampia zona vuota, dove lo spazio stacca nettamente su un piano molto arretrato e basso. Qui una fila di altissime colonne di marmo senza capitello (alla base sono molte, proiettanti le loro ombre sui gradini, ma nella parte superiore solo una è dipinta) allude forse al tempio di Salomone e sovrasta un minuscolo uomo emaciato. Egli srotola una pergamena, forse in qualità di profeta o forse quale San Girolamo, che aveva discusso l\'affermazione del dogma dell\'Immacolata. Accanto a lui doveva trovarsi un secondo personaggio, di cui l\'artista fece in tempo a dipingere appena un piede: forse era un san Francesco, patrocinante del culto dell\'Immacolata.', 1516, 'Dipinto', 'Olio su tavola', NULL, '216 x 132', 0, 'Images/Uploaded/aa7a8a0e0d8943cba3780e62b2688d11c05d8166.jpeg', 'admin'),
(45, 'Antonello da Messina', 'Annunciata di Palermo', 'Maria è colta nell\'attimo in cui l\'interlocutore le è davanti, e la sua mano destra sembra volerlo frenare; dalla sagoma dalla geometria del manto essenziale emerge il perfetto ovale del volto della Vergine. Un asse della composizione è dato dalla piega del manto sulla fronte, giù fino all\'angolo del leggio; al contrario, il lento girare della figura e il gesto della mano danno naturalezza alla composizione. Un\'interpretazione intravede i diversi momenti di un racconto presenti nell\'espressività delle mani, dello sguardo e delle labbra.\r\n\r\nLa posa è di tre quarti, lo sfondo scuro e la rappresentazione essenziale derivano dai modelli fiamminghi. La luce è radente ed illumina il volto quasi facendo emergere gradualmente i lineamenti e la verità del personaggio. L\'uso dei colori a olio permette poi un\'attenta qualità della luce, con morbidissimi accostamenti che riescono a restituire la diversa consistenza dei materiali, legno, carta, tessuto, incarnato.\r\n\r\nA differenza delle opere fiamminghe però, Antonello ha una salda impostazione volumetrica della figura, con semplificazione dello stile \"epidermico\" dei fiamminghi che permette di concentrarsi su altri aspetti, quali il dato fisionomico individuale e la componente psicologica, nonché il più avanzato realismo.\r\n\r\nL\'opera rappresenta uno dei traguardi fondamentali della pittura rinascimentale italiana. La purezza formale, lo sguardo magnetico e la mano sospesa in una dimensione astratta ne fanno un capolavoro assoluto.\r\n\r\nRecenti studi di Salvatore Lentini hanno evidenziato innumerevoli manipolazioni che ne hanno modificato l\'aspetto.', 1475, 'Dipinto', 'Olio su tavola', NULL, '45 x 34', 1, 'Images/Uploaded/dc7a18f9fb7bb144fada5559e71ddbc36186170b.jpeg', 'admin'),
(46, 'Leonardo Da Vinci', 'Dama con l\'ermellino', 'In quest\'opera lo schema del ritratto quattrocentesco, a mezzo busto e di tre quarti, venne superato da Leonardo, che concepì una duplice rotazione, con il busto rivolto a sinistra e la testa a destra. Vi è corrispondenza tra il punto di vista della giovane e dell\'ermellino; l\'animale infatti sembra identificarsi con la fanciulla, per una sottile comunanza di tratti, per gli sguardi dei due, che sono intensi e allo stesso tempo candidi. La figura slanciata della giovane trova riscontro armonico nell\'animale.\r\n\r\nLa dama sembra volgersi come se stesse osservando qualcuno sopraggiungente nella stanza, e al tempo stesso ha l\'imperturbabilità solenne di un\'antica statua. Un impercettibile sorriso aleggia sulle sue labbra: per esprimere un sentimento Leonardo preferiva accennare alle emozioni piuttosto che renderle esplicite. Grande risalto è dato alla mano, investita dalla luce, con le dita lunghe e affusolate che accarezzano l\'animale, testimoniando la sua delicatezza e la sua grazia.\r\n\r\nL\'abbigliamento della donna è curatissimo, ma non eccessivamente sfarzoso, per l\'assenza di gioielli, a parte la lunga collana di granati, che sono simbolo di amore fedele (la collana era probabilmente un dono di Ludovico il Moro) e nel contempo fanno un bel contrasto con la bella carnagione chiara della giovane. Come tipico nei vestiti dell\'epoca, le maniche sono le parti più elaborate, in questo caso di due colori diversi, adornate da nastri che, all\'occorrenza, potevano essere sciolti per sostituirle. Un laccio nero sulla fronte tiene fermo un velo dello stesso colore dei capelli raccolti.', 1489, 'Dipinto', 'Olio su tavola', NULL, '54 x 40', 0, 'Images/Uploaded/8a24b9a9b35ba32721e09b76bdc41ecaa39a69c0.jpeg', 'admin'),
(47, 'Sandro Botticelli', 'Calunnia', 'La complessa iconografia riprende fedelmente l\'episodio originale, inserendolo all\'interno di una grandiosa aula, riccamente decorata di marmi e rilievi dorati e affollata di personaggi. Il quadro va letto da destra verso sinistra: re Mida (riconoscibile dalle orecchie d\'asino), nelle vesti del cattivo giudice, è seduto sul trono, consigliato da Ignoranza e Sospetto; davanti a lui sta il Livore (cioè il \"rancore\"), l\'uomo con il cappuccio marrone, coperto di stracci che tiene per il braccio la Calunnia, donna molto bella, che si fa acconciare i capelli da Insidia e Frode, mentre trascina a terra il Calunniato impotente e con l\'altra mano impugna una fiaccola che non fa luce, simbolo della falsa conoscenza; la vecchia sulla sinistra è il Rimorso e l\'ultima figura di donna sempre a sinistra è la Nuda Veritas, con lo sguardo rivolto al cielo, come a indicare l\'unica vera fonte di giustizia.\r\n\r\nL\'architettura, che anticipa i modi cinquecenteschi, mostra un ampio loggiato composto da pilastri con nicchie e archi a tutto sesto con lacunari; fregi dorati corrono sui plinti, nei lacunari, sulle basi delle nicchie e sopra di esse, con varie scene mitologiche; dentro le nicchie si trovano statue a tutto tondo di figure bibliche e dell\'antichità classica: si riconoscono una Giuditta con la testa decapitata di Oloferne dietro il trono di Mida e un cavaliere, forse Re Davide, nella nicchia centrale. Questa sintesi tra mondo classico e mondo cristiano rimanda alle meditazioni umanistiche dell\'Accademia neoplatonica. Oltre gli archi si vede solo un cielo lontano e cristallino.', 1493, 'Dipinto', 'Tempera su tavola', NULL, '62 x 91', 0, 'Images/Uploaded/bfd12d83fb020890f7f189372f99d1e61c727db7.jpeg', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `Recensioni`
--

CREATE TABLE IF NOT EXISTS `Recensioni` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Oggetto` varchar(64) COLLATE utf8_bin NOT NULL,
  `Contenuto` text COLLATE utf8_bin NOT NULL,
  `DataUltimaModifica` date NOT NULL,
  `Utente` varchar(32) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Utente_Recensione` (`Utente`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `Recensioni`
--

INSERT INTO `Recensioni` (`ID`, `Oggetto`, `Contenuto`, `DataUltimaModifica`, `Utente`) VALUES
(27, 'Museo bellissimo', 'Uno dei musei più belli mai visitati. Non solo la collezione di opere d\'arte è sconfinata ma anche il palazzo da solo fa la sua bellissima figura. Ci vado almeno una volta all\'anno per ammirare opere che prima non avevo notato. Unica pecca è la fila infinita, prenotazioni online o no. So che adesso hanno introdotto il sistema degli orari. Arrivi alla cassa e prendi il biglietto con l\'orario segnato. Nel mentre puoi goderti la zona e tornare all\'ora scritta sul biglietto. Spero di poterci tornare presto!', '2020-06-08', 'user'),
(28, 'Un museo da ammirare', 'Un lungo excursus nella storia dell\'arte italiana e non. Sono esposti numerosi capolavori. Fortunatamente ci sono panche ovunque, dove sostare per un po\'. Consiglio di prenotare la visita per non rimanere in coda per ore, e di visitarlo ai primi turni mattutini, perché lo troverete sempre e comunque sovraffollato. Per fotografare ed ammirare da vicino alcuni capolavori di Botticelli o di altri artisti, bisogna superare la ressa attendendo il proprio turno. Meravigliose opere e meravigliose sale.', '2020-06-08', 'user'),
(29, 'Un percorso d\'arte', 'Non avevo mai visto un unico edificio con tanta arte. Entrare in una stanza ed essere all\'improvviso a contatto con un Caravaggio mi ha regalato un\'emozione unica. Ovviamente gli artisti sono centinaia ed è possibile ammirare tele che solitamente si possono vedere solo sui libri. La coda per l\'ingresso sembrava interminabile alla vista ma è durata poco più di un quarto d\'ora. Assolutamente da visitare.', '2020-06-08', 'user'),
(30, 'Stupendo', 'Non ci sono parole per descrivere questo museo, l\'unica cosa da fare è alzarsi dal divano e andare a vedere le opere dei più grandi artisti del rinascimento. Leonardo, Michelangelo, Raffaello, Tiziano, etc.', '2020-06-08', 'user'),
(31, 'Museo consigliato', 'Molto bella e interessante. Anche a Sara è piaciuta molto. Ci vuole un bel po\' di tempo per visitarla ma ne vale veramente la pena. Si esce da questa visita con soddisfazione e con una conoscenza in più su ciò che si è visto. La visita è meglio farla con le cuffie. Si ascoltano informazioni dettagliate su ciò che si visita. Consigliata!!', '2020-06-08', 'user'),
(32, 'Quanti capolavori', 'Visitare in gennaio questo meraviglioso museo è un\'emozione inenarrabile. Le sale dedicate al rinascimento con pochi turisti, il silenzio, la luce che filtra dalle vetrate rendono unica questa esperienza. I capolavori esposti sono meravigliosi. Irrinunciabile.', '2020-06-08', 'user'),
(33, 'Senza parole', 'È bellissima e consiglio di andare a visitarla. Meravigliosa l\'intera struttura e il percorso che ti fanno effettuare all\'interno. Nonostante io non sia una fanatica dell\'arte l’ho trovata affascinante!! Da restare a bocca aperta.', '2020-06-08', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `Utenti`
--

CREATE TABLE IF NOT EXISTS `Utenti` (
  `Nome` varchar(64) COLLATE utf8_bin NOT NULL,
  `Cognome` varchar(64) COLLATE utf8_bin NOT NULL,
  `DataNascita` date NOT NULL,
  `Sesso` enum('M','F','A') COLLATE utf8_bin NOT NULL,
  `Username` varchar(64) COLLATE utf8_bin NOT NULL,
  `Email` varchar(64) COLLATE utf8_bin NOT NULL,
  `Password` varchar(64) COLLATE utf8_bin NOT NULL,
  `Admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`Username`),
  UNIQUE KEY `Username` (`Username`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `Utenti`
--

INSERT INTO `Utenti` (`Nome`, `Cognome`, `DataNascita`, `Sesso`, `Username`, `Email`, `Password`, `Admin`) VALUES
('Fiammetta', 'Cannavò', '1998-08-11', 'F', 'admin', 'fiammetta.cannavo@studenti.unipd.it', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 1),
('Lorenzo', 'Dei Negri', '1998-04-27', 'M', 'user', 'lorenzo.deinegri@studenti.unipd.it', '04f8996da763b7a969b1028ee3007569eaf3a635486ddab211d512c85b9df8fb', 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Eventi`
--
ALTER TABLE `Eventi`
  ADD CONSTRAINT `FK_Utente_Evento` FOREIGN KEY (`Utente`) REFERENCES `Utenti` (`Username`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `Opere`
--
ALTER TABLE `Opere`
  ADD CONSTRAINT `FK_Utente_Opera` FOREIGN KEY (`Utente`) REFERENCES `Utenti` (`Username`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `Recensioni`
--
ALTER TABLE `Recensioni`
  ADD CONSTRAINT `FK_Utente_Recensione` FOREIGN KEY (`Utente`) REFERENCES `Utenti` (`Username`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
