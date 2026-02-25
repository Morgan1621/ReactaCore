using CAPA_APLICATION.DTOs;
using CAPA_APLICATION.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CAPA_APLICATION.Services
{
    public class NotificacionesServices
    {


        private readonly INotificacionesRepository _RepositoryNoti;

        public NotificacionesServices(INotificacionesRepository repository)
        {
            _RepositoryNoti = repository;
        }

        //Listar eVENTO //



        public async Task<IEnumerable<NotificacionesDTOs>> ListarNotificaciones()
        {
            var listar = await _RepositoryNoti.ListarnotificacionAsync();

            return listar.Select(p => new NotificacionesDTOs
            {
                NotificacionId = p.NotificacionId,
                UsuarioId = p.UsuarioId,
                Mensaje = p.Mensaje,
                Fecha = p.Fecha,
              
            });
        }

        public async Task<IEnumerable<NotificacionesDTOs>> ListarNombreNotificaciones(string Buscar)
        {
            if (string.IsNullOrWhiteSpace(Buscar))
                return Enumerable.Empty<NotificacionesDTOs>();

            var lista = await _RepositoryNoti.ListarnotificacionPorNombreAsync();

            return lista.Select(p => new NotificacionesDTOs
            {
                NotificacionId = p.NotificacionId,
                UsuarioId = p.UsuarioId,
                Mensaje = p.Mensaje,
                Fecha = p.Fecha,

            });

        }
    }
}
