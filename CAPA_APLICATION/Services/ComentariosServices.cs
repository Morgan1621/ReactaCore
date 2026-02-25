using CAPA_APLICATION.DTOs;
using CAPA_APLICATION.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.Services
{
    public class ComentariosServices
    {
        private readonly IComentariosRepository _RepositoryComentarios;

        public ComentariosServices(IComentariosRepository repository)
        {
            _RepositoryComentarios = repository;
        }

        //Listar eVENTO //



        public async Task<IEnumerable<ComentariosDTOs>> ListarComentarios()
        {
            var listar = await _RepositoryComentarios.ListarComentaiosAsync();

            return listar.Select(p => new ComentariosDTOs
            {
                ComentarioId = p.ComentarioId,
                UsuarioId = p.UsuarioId,
                EventoId = p.EventoId,
                Comentario = p.Comentario,
                Fecha = p.Fecha,
              

            });
        }

        public async Task<IEnumerable<ComentariosDTOs>> ListarNombreComentarios(string Buscar)
        {
            if (string.IsNullOrWhiteSpace(Buscar))
                return Enumerable.Empty<ComentariosDTOs>();

            var lista = await _RepositoryComentarios.ListarComentaiosPorNombreAsync();

            return lista.Select(p => new ComentariosDTOs
            {
                ComentarioId = p.ComentarioId,
                UsuarioId = p.UsuarioId,
                EventoId = p.EventoId,
                Comentario = p.Comentario,
                Fecha = p.Fecha,


            });

        }


    }
}
