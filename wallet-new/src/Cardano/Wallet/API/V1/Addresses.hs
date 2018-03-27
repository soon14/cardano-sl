module Cardano.Wallet.API.V1.Addresses where

import           Servant
import           Universum (Text)

import           Cardano.Wallet.API.Response
import           Cardano.Wallet.API.Types
import           Cardano.Wallet.API.V1.Parameters
import           Cardano.Wallet.API.V1.Types


type API = Tags '["Addresses"] :>
      (    "addresses" :> WalletRequestParams
                       :> Summary "Returns a list of the addresses."
                       :> Get '[ValidJSON] (WalletResponse [WalletAddress])
      :<|> "addresses" :> ReqBody '[ValidJSON] NewAddress
                       :> Summary "Creates a new Address."
                       :> Post '[ValidJSON] (WalletResponse WalletAddress)
      :<|> "addresses" :> Capture "address" Text
                       :> "validity"
                       :> Summary "Checks the validity of an address."
                       :> Get '[ValidJSON] (WalletResponse AddressValidity)
      :<|> "addresses" :> "external"
                       :> ReqBody '[ValidJSON] NewExternalAddress
                       :> Summary "Creates a new Address in external wallet."
                       :> Post '[ValidJSON] (WalletResponse WalletAddress)
      )
