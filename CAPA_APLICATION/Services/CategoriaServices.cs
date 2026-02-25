using CAPA_APLICATION.DTOs;
using CAPA_APLICATION.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.Services
{
    public class CategoriaServices
    {

        private readonly ICategoriaRepository _RepositorycAtegoria;

        public CategoriaServices(ICategoriaRepository repository)
        {
            _RepositorycAtegoria = repository;
        }

        //Listar CATEGORIA //



        public async Task<IEnumerable<CategoriaDTOs>> ListarCategoria()
        {
            var listar = await _RepositorycAtegoria.ListarCategoriaAsync();

            return listar.Select(p => new CategoriaDTOs
            {
                CategoriaId = p.CategoriaId,
                NombreCategoria = p.NombreCategoria,
                EstadoId = p.EstadoId,
               


            });
        }

        public async Task<IEnumerable<CategoriaDTOs>> ListarNombreUsuario(string Buscar)
        {
            if (string.IsNullOrWhiteSpace(Buscar))
                return Enumerable.Empty<CategoriaDTOs>();

            var lista = await _RepositorycAtegoria.ListarCategoriaPorNombreAsync();

            return lista.Select(p => new CategoriaDTOs
            {
                CategoriaId = p.CategoriaId,
                NombreCategoria = p.NombreCategoria,
                EstadoId = p.EstadoId,

            });

        }

    }
}
