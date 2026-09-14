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
