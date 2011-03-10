module Types where

----------------------------------------------------------------

data Command = Sync
             | Install
             | Uninstall
             | Installed
             | Configure
             | Build
             | Clean
             | Outdated
             | Sdist
             | Unpack
             | Info
             | Deps
             | Help
             deriving (Eq,Show)

data CommandSpec = CommandSpec {
    command :: Command
  , commandNames :: [String]
  , document :: String
  , routing :: Route
  , options :: OptionDB
  }

type CommandDB = [CommandSpec]

----------------------------------------------------------------

data Option = OptHelp
            | OptNoHarm
            | OptRecursive

data OptionSpec = OptionSpec {
    option :: Option
  , optionNames :: [String]
  , actualOption ::  String
  }

type OptionDB  = [OptionSpec]

----------------------------------------------------------------

type FunctionCommand = CommandSpec -> [String] -> [OptionSpec] -> IO ()

data Route = RouteFunc FunctionCommand
           | RouteProc String [String]

----------------------------------------------------------------
