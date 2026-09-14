function appMainHTML( ) {
    // TODO: main should request server for its contents
    const main = document.getElementById( 'main' );
    if ( !main ) throw new Error( 'appMainHTML: main element not found' );
    main.innerHTML = '<p>Dark Souls 2 (Scholar of the First Sin) Wiki Site</p>';
}

try {
    appMainHTML();
} catch ( exception ) {
    console.log( exception )
}

// GNU Affero General Public License v3.0 or later
// NO WARRANTY OF ANY KIND more details at <https://www.gnu.org/licenses/>
// SPDX-License-Identifier: AGPL-3.0-or-later
// app: `ds2_wiki` Dark Souls 2 (Scholar of the First Sin) Wiki Site
// Ⓒ Copyright (C) 2026 Oleg'Ease'Kharchuk ᦒ
