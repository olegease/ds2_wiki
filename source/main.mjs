import { readFile }         from 'node:fs/promises';
import { createServer }     from 'node:http';
import path                 from 'node:path'
import { fileURLToPath }    from 'node:url';

const App = {
    Http: 'http',
    Host: '127.0.0.1',
    Port: 8080,
    listener( ) {
        console.log( `Listen on ${this.Http}://${this.Host}:${this.Port}` );
    },
    Valid_Pages: ['index.html', 'assets/styles.css', 'assets/scripts.js'],
    validate( request ) {
        const q = request;
        if ( q.method !== 'GET' ) throw new Error( 'App.validate: only get method is allowed' );
        const page = q.url === '/' ? 'index.html' : q.url.substring( 1 );
        const isPageValid = this.Valid_Pages.includes( page );
        if ( !isPageValid ) throw new Error( `App.validate: invalid page '${page}'` );
        console.log( `Page: ${page}` );
        return page;
    },
    Public_Dir: path.join( path.dirname( fileURLToPath( import.meta.url ) ), '../public' ),
    Mime: {
        '.html': 'text/html',
        '.css': 'text/css',
        '.js': 'text/javascript',
    },
    async response( request, response ) {
        const s = response;
        try {
            const page = this.validate( request );
            const text = await readFile( path.join( this.Public_Dir, page ) );
            s.writeHead( 200, { 'Content-Type': this.Mime[path.extname( page )] } );
            s.end( text, 'utf-8' );
        } catch ( exception ) {
            console.log( exception );
            s.writeHead( 404 );
            s.end( 'Not Found', 'utf-8' );
        }
    }
};

const main = createServer( ( q, s ) => App.response( q, s ) );

main.listen( App.Port, App.Host, () => App.listener( ) );

// GNU Affero General Public License v3.0 or later
// NO WARRANTY OF ANY KIND more details at <https://www.gnu.org/licenses/>
// SPDX-License-Identifier: AGPL-3.0-or-later
// app: `ds2_wiki` Dark Souls 2 (Scholar of the First Sin) Wiki Site
// Ⓒ Copyright (C) 2026 Oleg'Ease'Kharchuk ᦒ
