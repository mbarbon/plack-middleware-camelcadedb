use Plack::Middleware::Camelcadedb (
    debug_client_path        => $ENV{REMOTE_DEBUGGER},
    $ENV{DEBUGGER_PATH} ? (
        client_socket        => $ENV{DEBUGGER_PATH},
    ) : (
        remote_host          => "localhost:" . ($ENV{DEBUGGER_PORT} // 9000),
    ),
);
use lib 't/apps/lib';
use Plack::Builder;
use App::Base;

builder {
    enable "Camelcadedb";
    \&App::Base::app;
}
