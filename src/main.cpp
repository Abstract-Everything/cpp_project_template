#include <spdlog/spdlog.h>

#include <functional>
#include <iostream>

static constexpr auto USAGE =
    R"(Naval Fate.

    Usage:
          naval_fate ship new <name>...
          naval_fate ship <name> move <x> <y> [--speed=<kn>]
          naval_fate ship shoot <x> <y>
          naval_fate mine (set|remove) <x> <y> [--moored | --drifting]
          naval_fate (-h | --help)
          naval_fate --version

    Options:
          -h --help     Show this screen.
          --version     Show version.
          --speed=<kn>  Speed in knots [default: 10].
          --moored      Moored (anchored) mine.
          --drifting    Drifting mine.
)";

int main(int /* argc */, const char ** /* argv */)
{
	std::cout << USAGE;

	spdlog::info("Hello, {}!", "World");

	fmt::print("Hello, from {}\n", "{fmt}");
}
