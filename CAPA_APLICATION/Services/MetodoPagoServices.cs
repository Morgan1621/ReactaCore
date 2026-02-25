using CAPA_APLICATION.DTOs;
using CAPA_APLICATION.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.Services
{
    public class MetodoPagoServices
    {
        private readonly IMetodosPagoRepository _RepositoryMetodospAGOS;

        public MetodoPagoServices(IMetodosPagoRepository repository)
        {
            _RepositoryMetodospAGOS = repository;
        }

        //Listar Meotodopago //



        public async Task<IEnumerable<MetodosPagoDTOs>> ListarEvento()
        {
            var listar = await _RepositoryMetodospAGOS.ListarMetodosPagoAsync();

            return listar.Select(p => new MetodosPagoDTOs
            {
                MetodoPagoId = p.MetodoPagoId,
                NombreMetodo = p.NombreMetodo,
               
            });
        }

        public async Task<IEnumerable<MetodosPagoDTOs>> ListarNombreMetodoPago(string Buscar)
        {
            if (string.IsNullOrWhiteSpace(Buscar))
                return Enumerable.Empty<MetodosPagoDTOs>();

            var lista = await _RepositoryMetodospAGOS.ListarMetodosPagoPorNombreAsync();

            return lista.Select(p => new MetodosPagoDTOs
            {
                MetodoPagoId = p.MetodoPagoId,
                NombreMetodo = p.NombreMetodo,


            });

        }



    }
}
