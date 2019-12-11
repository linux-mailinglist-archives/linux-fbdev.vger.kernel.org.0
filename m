Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0C5111A5F0
	for <lists+linux-fbdev@lfdr.de>; Wed, 11 Dec 2019 09:35:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726988AbfLKIfh (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 11 Dec 2019 03:35:37 -0500
Received: from protonic.xs4all.nl ([83.163.252.89]:38616 "EHLO protonic.nl"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726845AbfLKIfh (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 11 Dec 2019 03:35:37 -0500
Received: from webmail.promanet.nl (edge2.prtnl [192.168.1.170])
        by sparta (Postfix) with ESMTP id B678944A004C;
        Wed, 11 Dec 2019 09:35:33 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 11 Dec 2019 09:35:35 +0100
From:   robin <robin@protonic.nl>
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>,
        intel-gfx@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v3 12/12] auxdisplay: constify fb ops
In-Reply-To: <87pngx4muv.fsf@intel.com>
References: <cover.1575390740.git.jani.nikula@intel.com>
 <31c18e3ce9d6962aabda4799b3051039ff591c92.1575390741.git.jani.nikula@intel.com>
 <87pngx4muv.fsf@intel.com>
Message-ID: <7c78b5c7421f75c2afdeb4b3a15c8a09@protonic.nl>
X-Sender: robin@protonic.nl
User-Agent: Roundcube Webmail/1.3.6
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hello Jani,

On 2019-12-09 15:03, Jani Nikula wrote:
> On Tue, 03 Dec 2019, Jani Nikula <jani.nikula@intel.com> wrote:
>> Now that the fbops member of struct fb_info is const, we can start
>> making the ops const as well.
>> 
>> Cc: Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>
>> Cc: Robin van der Gracht <robin@protonic.nl>
>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Reviewed-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
>> Acked-by: Robin van der Gracht <robin@protonic.nl>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> Miguel, Robin, just to err on the safe side, were you both okay with me
> merging this through drm-misc? Not very likely to conflict badly.

ht16k33 driver hasn't seen much change lately, should be fine.

Robin
