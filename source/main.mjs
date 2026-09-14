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
    Public_Dir: path.join( path.dirname( fileURLToPath( import.meta.url ) ), '../public' ),
    validate( request ) {
        const q = request;
        // TODO: validate public dir also
        console.log( q.url );
        if ( q.method !== 'GET' ) throw new Error( 'App.validate: only get method is allowed' );
        if ( q.url !== '/' ) throw new Error( 'App.validate: only / is allowed' );
        return 'index.html';
    },
    async response( request, response ) {
        const s = response;
        try {
            const page = this.validate( request );
            const text = await readFile( path.join( this.Public_Dir, page ) );
            s.writeHead( 200, { 'Content-Type': 'text/html' } );
            s.end( text, 'utf-8' );
        } catch ( exception ) {
            console.log( exception );
            s.writeHead( 404 );
            s.end( 'Not Found', 'utf-8' );
        }
    }
};

const main = createServer( async ( q, s ) => await App.response( q, s ) );

main.listen( App.Port, App.Host, () => App.listener( ) );
