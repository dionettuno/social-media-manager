# CLAUDE.md: regole fisse per il social media manager di TradeGPT

Questo repo contiene un manager automatico per l'account Instagram di TradeGPT.
Ogni settimana prepari i contenuti come file. NON pubblichi mai nulla. Una persona
rivede la Pull Request, fa il merge e pubblica a mano.

## Cartelle

- `brand/` dati ufficiali dell'app (unica fonte per funzioni e screenshot)
- `voice.md` voce del brand (usa questo, NON `~/.claude/instagram/voice.md`)
- `inputs/trend_links.md` extra opzionale scritto dal proprietario
- `output/AAAA-MM-GG/` contenuti della settimana (data = lunedì dell'esecuzione)
- `.claude/skills/ig-*` skill di scrittura. In questo repo `swipe.md`, `log.md` e ogni
  altro file di stato vivono dentro il repo (`output/`), mai in `~/.claude/`.

## Divieti assoluti

- Non pubblicare, non commentare, non inviare DM, non fare login su nessun social.
- Non fare scraping di Instagram e non aprirlo con browser o script. Solo file di testo/markdown.
- Non usare le skill `ig-viral`, `ig-dm`, `ig-audit`, `ig-profile`, `ig-repurpose` nel job settimanale: richiedono browsing o accesso all'account.
- Non installare pacchetti (niente pip, npm, yt-dlp). Gli script Python delle skill usano solo la libreria standard.
- Non toccare file fuori da `output/` (salvo che il compito lo dica esplicitamente).

## Trend: fonti ammesse

Ricerca web su fonti pubbliche: articoli, report di trend, blog di marketing, pagine
pubbliche di YouTube/TikTok/Reddit trovate dalla ricerca. Niente login, niente
scraping di massa, niente Instagram diretto. Cita ogni fonte con URL e data nel report.
Se non trovi evidenza solida di un trend, scrivilo e non inventarlo.

## Veridicità

- Non inventare metriche, clienti, recensioni, screenshot o funzioni dell'app.
- Usa solo informazioni presenti in `brand/` o nelle tue conoscenze generali verificabili.
  Se manca un dato, scrivi `{{segnaposto}}` e segnalalo in `report.md`.
- Ogni Reel/carosello che mostra l'app deve indicare quale screenshot di
  `brand/screenshot/` usare. Se non esiste, scrivi `{{screenshot da registrare: descrizione}}`.
- L'app oggi è solo Android. iOS è "in arrivo": mai scrivere che è già disponibile su iOS.

## Materiale e fonti sull'app

- Fonti ammesse per fatti sull'app: `brand/`, https://tradegpt-vector.com e la scheda Google Play.
  Le pagine pubbliche degli asset sul sito (es. `/assets/nvda.html`) possono ispirare temi educativi.
- Non usare le etichette "STRONG BUY / BUY" e le stime "+x% Est." del sito, né `brand/site-visuals/panel_2.webp`.
- Non citare valutazioni, numeri di utenti o di asset marcati "da confermare" in `brand/README.md`.
- Se mancano screenshot veri, `report.md` elenca le registrazioni schermo da fare (max 10 minuti), con istruzioni passo passo.

## Formati e presentatori

- Ogni settimana mescola: almeno 1 Reel faceless (screen recording + voiceover), almeno 1 con presentatore AI,
  il terzo a scelta. Ogni script indica `FORMATO: faceless | presentatore AI | misto`.
- Per i presentatori AI: descrivi persona, abbigliamento, ambiente e tono per lo strumento di generazione;
  il volto è sempre dichiarato AI nel report e in caption quando realistico.
- Nessuna storia personale, guadagno o testimonianza attribuita a un volto inventato.
- Obiettivo della pagina: pubblico ampio e attivo (salvataggi, condivisioni, commenti), poi conversione in download.
  Privilegia contenuti educativi da salvare e condividere; CTA verso download solo in parte dei post.

## Compliance finanza

- Mai consigli di investimento, mai "compra/vendi", mai rendimenti garantiti o previsioni certe.
- Le proiezioni dell'app sono statistiche: dillo ("statistical projections", "scenarios").
- Contenuti che mostrano analisi o proiezioni: aggiungi "Not financial advice. For informational purposes only."
- Niente esempi di trade con profitti inventati. Se usi esempi, sono ipotetici e segnalati come tali.

## Stile

- Lingua dei contenuti: inglese (pubblico internazionale). Report e note per il proprietario: italiano.
- Hashtag: massimo 5 per post.
- Niente em dash (il carattere "—"). Usa virgola, punto o trattino semplice.
- Esegui `/ig-human` (humanize.py + detect.py) su OGNI testo prima di salvarlo.
- Ogni hook va valutato con `hookscore.py`. Scarta gli hook deboli e riscrivili.
- Ottimizza il potenziale virale al massimo (hook forte, ritmo, retention, CTA chiara, formati di tendenza),
  ma NON promettere viralità: lo scorer scarta i pessimi hook, non prevede i vincenti.

## Output attesi (in `output/AAAA-MM-GG/`)

`piano.md`, `reel_1.md`..`reel_3.md`, `carousel_1.md`, `carousel_2.md`, `storie.md`,
`risposte.md`, `commenti.md`, `report.md`. Non ripetere idee delle ultime 2 settimane.
`report.md` (italiano): perché questi formati, trend usati con fonti, dati mancanti
(`{{segnaposto}}`), checklist di pubblicazione.
