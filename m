Return-Path: <linux-fbdev+bounces-3134-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 570829866EE
	for <lists+linux-fbdev@lfdr.de>; Wed, 25 Sep 2024 21:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 765B21C20ACE
	for <lists+linux-fbdev@lfdr.de>; Wed, 25 Sep 2024 19:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24D711369BC;
	Wed, 25 Sep 2024 19:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="sPyutr75"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CB01D5ABE;
	Wed, 25 Sep 2024 19:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727292815; cv=none; b=RV1YGY/UJhuNC/W8EN8tGQ4FMcTlUaUgkJh0Wh7aTaiSe4Lt6U6CX+bb3wHpDsCzMLj5pE8TE6NVRBuAm+lZHNkJD4W2LO+GNZ2zx+AqjKUUSJsJKpwq5qRFi51TFC+ytp+4mv167wJxkd7eMO6ScED5Gngbl2+zv8BQi6DifrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727292815; c=relaxed/simple;
	bh=Hx/rlkYU0ZVVReIDGCS57p8OVIwu1U+jY2KjmIVkXlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KSWz6xQ3fuoEPP333H+dikHZS6nvVQMeystAb5qMoH0JtrEFwD20BmsjfUINahkazfQnc6ysjhTz84gFRinZ4SYpSsQ/qMlf1D/DmrQw5AvOdph/2rN8CIYSowPjAGaev3CTNQZ0Ylu0fsrk71GJ/dnzy/G3WcSKcbpKvdOTOPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=sPyutr75; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1727292802; x=1727897602; i=deller@gmx.de;
	bh=nXH904ypmTw/gJKVkpTGZ7KBXsxTPIsGXQBiVA1uwKY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=sPyutr758U0cFCKASc+SjRzfaI+0Gv8mVUqK8k2ynGFrk4dvWGhpE6fH/QlhMSsV
	 TutqIyDa7/wnSskO7clUXtE4lYSE9coJydngIkXQ3N1X8dr006ToCnhnoqEU/hX2Z
	 rAZpBXChSbhO2Gpm6S8umUCl3hockGOYpWjiXZjZGfgviiHKK8YmdD4NNCHUzl+AX
	 fjodbb1rkze/2CSL581fzy/AAQFRi9HiBuBq9davhL7ERqtKppivGGyweTUhnDuTh
	 jW/QidViI5INm3WRiwpcMx2AhbLT0mHSzmZdeta5IoSTqUXqI7R69UbUSQ4fKgcXY
	 FrzRDSuqOObKx6cwhA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MIx3C-1sedXk1i6k-00PZjm; Wed, 25
 Sep 2024 21:33:22 +0200
Message-ID: <acb94eab-78e1-4e79-8c3f-11eefe525324@gmx.de>
Date: Wed, 25 Sep 2024 21:33:21 +0200
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] fbcon: Fix a NULL pointer dereference issue in
 fbcon_putcs
To: Qianqiang Liu <qianqiang.liu@163.com>
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 syzbot+3d613ae53c031502687a@syzkaller.appspotmail.com
References: <20240916011027.303875-1-qianqiang.liu@163.com>
 <a57734e8-ffb9-4af1-be02-eb0c99507048@gmx.de> <ZvLlEpIMQnJcJsla@thinkpad>
 <1b1a2d3c-ed4a-4d9b-b87a-8d05f3d6592e@gmx.de> <ZvOfwLvWdNHiU4g8@thinkpad>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 xsFNBF3Ia3MBEAD3nmWzMgQByYAWnb9cNqspnkb2GLVKzhoH2QD4eRpyDLA/3smlClbeKkWT
 HLnjgkbPFDmcmCz5V0Wv1mKYRClAHPCIBIJgyICqqUZo2qGmKstUx3pFAiztlXBANpRECgwJ
 r+8w6mkccOM9GhoPU0vMaD/UVJcJQzvrxVHO8EHS36aUkjKd6cOpdVbCt3qx8cEhCmaFEO6u
 CL+k5AZQoABbFQEBocZE1/lSYzaHkcHrjn4cQjc3CffXnUVYwlo8EYOtAHgMDC39s9a7S90L
 69l6G73lYBD/Br5lnDPlG6dKfGFZZpQ1h8/x+Qz366Ojfq9MuuRJg7ZQpe6foiOtqwKym/zV
 dVvSdOOc5sHSpfwu5+BVAAyBd6hw4NddlAQUjHSRs3zJ9OfrEx2d3mIfXZ7+pMhZ7qX0Axlq
 Lq+B5cfLpzkPAgKn11tfXFxP+hcPHIts0bnDz4EEp+HraW+oRCH2m57Y9zhcJTOJaLw4YpTY
 GRUlF076vZ2Hz/xMEvIJddRGId7UXZgH9a32NDf+BUjWEZvFt1wFSW1r7zb7oGCwZMy2LI/G
 aHQv/N0NeFMd28z+deyxd0k1CGefHJuJcOJDVtcE1rGQ43aDhWSpXvXKDj42vFD2We6uIo9D
 1VNre2+uAxFzqqf026H6cH8hin9Vnx7p3uq3Dka/Y/qmRFnKVQARAQABzRxIZWxnZSBEZWxs
 ZXIgPGRlbGxlckBnbXguZGU+wsGRBBMBCAA7AhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheA
 FiEERUSCKCzZENvvPSX4Pl89BKeiRgMFAl3J1zsCGQEACgkQPl89BKeiRgNK7xAAg6kJTPje
 uBm9PJTUxXaoaLJFXbYdSPfXhqX/BI9Xi2VzhwC2nSmizdFbeobQBTtRIz5LPhjk95t11q0s
 uP5htzNISPpwxiYZGKrNnXfcPlziI2bUtlz4ke34cLK6MIl1kbS0/kJBxhiXyvyTWk2JmkMi
 REjR84lCMAoJd1OM9XGFOg94BT5aLlEKFcld9qj7B4UFpma8RbRUpUWdo0omAEgrnhaKJwV8
 qt0ULaF/kyP5qbI8iA2PAvIjq73dA4LNKdMFPG7Rw8yITQ1Vi0DlDgDT2RLvKxEQC0o3C6O4
 iQq7qamsThLK0JSDRdLDnq6Phv+Yahd7sDMYuk3gIdoyczRkXzncWAYq7XTWl7nZYBVXG1D8
 gkdclsnHzEKpTQIzn/rGyZshsjL4pxVUIpw/vdfx8oNRLKj7iduf11g2kFP71e9v2PP94ik3
 Xi9oszP+fP770J0B8QM8w745BrcQm41SsILjArK+5mMHrYhM4ZFN7aipK3UXDNs3vjN+t0zi
 qErzlrxXtsX4J6nqjs/mF9frVkpv7OTAzj7pjFHv0Bu8pRm4AyW6Y5/H6jOup6nkJdP/AFDu
 5ImdlA0jhr3iLk9s9WnjBUHyMYu+HD7qR3yhX6uWxg2oB2FWVMRLXbPEt2hRGq09rVQS7DBy
 dbZgPwou7pD8MTfQhGmDJFKm2jvOwU0EXchrcwEQAOsDQjdtPeaRt8EP2pc8tG+g9eiiX9Sh
 rX87SLSeKF6uHpEJ3VbhafIU6A7hy7RcIJnQz0hEUdXjH774B8YD3JKnAtfAyuIU2/rOGa/v
 UN4BY6U6TVIOv9piVQByBthGQh4YHhePSKtPzK9Pv/6rd8H3IWnJK/dXiUDQllkedrENXrZp
 eLUjhyp94ooo9XqRl44YqlsrSUh+BzW7wqwfmu26UjmAzIZYVCPCq5IjD96QrhLf6naY6En3
 ++tqCAWPkqKvWfRdXPOz4GK08uhcBp3jZHTVkcbo5qahVpv8Y8mzOvSIAxnIjb+cklVxjyY9
 dVlrhfKiK5L+zA2fWUreVBqLs1SjfHm5OGuQ2qqzVcMYJGH/uisJn22VXB1c48yYyGv2HUN5
 lC1JHQUV9734I5cczA2Gfo27nTHy3zANj4hy+s/q1adzvn7hMokU7OehwKrNXafFfwWVK3OG
 1dSjWtgIv5KJi1XZk5TV6JlPZSqj4D8pUwIx3KSp0cD7xTEZATRfc47Yc+cyKcXG034tNEAc
 xZNTR1kMi9njdxc1wzM9T6pspTtA0vuD3ee94Dg+nDrH1As24uwfFLguiILPzpl0kLaPYYgB
 wumlL2nGcB6RVRRFMiAS5uOTEk+sJ/tRiQwO3K8vmaECaNJRfJC7weH+jww1Dzo0f1TP6rUa
 fTBRABEBAAHCwXYEGAEIACAWIQRFRIIoLNkQ2+89Jfg+Xz0Ep6JGAwUCXchrcwIbDAAKCRA+
 Xz0Ep6JGAxtdEAC54NQMBwjUNqBNCMsh6WrwQwbg9tkJw718QHPw43gKFSxFIYzdBzD/YMPH
 l+2fFiefvmI4uNDjlyCITGSM+T6b8cA7YAKvZhzJyJSS7pRzsIKGjhk7zADL1+PJei9p9idy
 RbmFKo0dAL+ac0t/EZULHGPuIiavWLgwYLVoUEBwz86ZtEtVmDmEsj8ryWw75ZIarNDhV74s
 BdM2ffUJk3+vWe25BPcJiaZkTuFt+xt2CdbvpZv3IPrEkp9GAKof2hHdFCRKMtgxBo8Kao6p
 Ws/Vv68FusAi94ySuZT3fp1xGWWf5+1jX4ylC//w0Rj85QihTpA2MylORUNFvH0MRJx4mlFk
 XN6G+5jIIJhG46LUucQ28+VyEDNcGL3tarnkw8ngEhAbnvMJ2RTx8vGh7PssKaGzAUmNNZiG
 MB4mPKqvDZ02j1wp7vthQcOEg08z1+XHXb8ZZKST7yTVa5P89JymGE8CBGdQaAXnqYK3/yWf
 FwRDcGV6nxanxZGKEkSHHOm8jHwvQWvPP73pvuPBEPtKGLzbgd7OOcGZWtq2hNC6cRtsRdDx
 4TAGMCz4j238m+2mdbdhRh3iBnWT5yPFfnv/2IjFAk+sdix1Mrr+LIDF++kiekeq0yUpDdc4
 ExBy2xf6dd+tuFFBp3/VDN4U0UfG4QJ2fg19zE5Z8dS4jGIbLg==
In-Reply-To: <ZvOfwLvWdNHiU4g8@thinkpad>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GhjcJBvIWCuBdISj33TK8C6II0pS/jTEZG/PvjpsJqAy8uOg1zq
 N7FyvHb5NO7vqr+gDBtnpPIBYEh3Sz+pWT1LckU9/Stme2ZWW9xOwYo9xkMRHNqWSGTo/4g
 7gTmcpbc1L3m6KoDiX8NSDvPFZHNzF7ZcbTgdaSN/D1KghsOgaXMKBa+VuDGy39Mjuobw67
 hKquVbZXwrRq2wviHjYRg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:K2D4VqVlOr4=;uYJHJmMdmWSu6wAChDv4BFsYkzc
 qIVp/Cq+7eaR4X8yhtVtbvC+XLRvWE00upEURQO3UCyceTc8dItIeqLKMelzRFiZHPcwLLJMT
 J7GeOIm59IgpBvnylos8uSH3siaZ7athVXD1rvVRD3xYa9MXUpMcUf7Ej6QhCpEZsWw/qfaRa
 BcPrXgpnHnFefZCrm8P2N2uHzZIzp1M34kNBtNgfyCW8kA/fN6zxZ44m610e0u9oHZS/dC9LD
 QWI8WHgsZ6uoHTNoKl0w9duL3ms1ZGfwTJgN79YBpq8cJaUo8VJlNrLyzwGjrBAUP+2wM6iSL
 SSIYinzt9MmAcDsEtfJvAzZ+gP9Q1JG4WOKxczk/YgqyMkThj0zv6cb7MWYrngGgn49DoEjqG
 C7VxLovfFIMBxrCEAL6bXxQnShNJQj8Ct3kGJ+0Pk9vqNI4d7DqbQfqe/5coKPQVVKpUVTHRc
 xRQlnFTETvNb32UxAMa7Ui+H0pxVGy4xEtB2fADunI39lClRvyEYjVKSGSlwUDEQqiCLtltDl
 AHv3NhQuF+PNufjhBoO+M7Wtkn13pqE92OUEOfI7mL8o/GhurFdUb1DeKJoMyMks+fQLmWJDd
 3rq2hH6chqbmOwLu4D+TmqXSg5QMbZ3uYzGXHs5X/NrAv7qktTCt4KDglQquk1HJhtExHy/39
 oQXlaXzPAHRI3TbDDr94YLqMfAo/6xpn9IuVfLjexNSIduvGh3sqJLRvJcD6OEqxUxJyXNfMv
 fhftg8ER/GutqNeUmMzR4IT8c2v0rPaNDlAz0WI8s+gtV4cW4T8mTlfTywEUKBlaEedrKQ5Gs
 /PFR4ZLyLoTYgFhhm3/QO9Qg==

On 9/25/24 07:29, Qianqiang Liu wrote:
> syzbot has found a NULL pointer dereference bug in fbcon.
> Here is the simplified C reproducer:
>
> struct param {
> 	uint8_t type;
> 	struct tiocl_selection ts;
> };
>
> int main()
> {
> 	struct fb_con2fbmap con2fb;
> 	struct param param;
>
> 	int fd =3D open("/dev/fb1", 0, 0);
>
> 	con2fb.console =3D 0x19;
> 	con2fb.framebuffer =3D 0;
> 	ioctl(fd, FBIOPUT_CON2FBMAP, &con2fb);
>
> 	param.type =3D 2;
> 	param.ts.xs =3D 0; param.ts.ys =3D 0;
> 	param.ts.xe =3D 0; param.ts.ye =3D 0;
> 	param.ts.sel_mode =3D 0;
>
> 	int fd1 =3D open("/dev/tty1", O_RDWR, 0);
> 	ioctl(fd1, TIOCLINUX, &param);
>
> 	con2fb.console =3D 1;
> 	con2fb.framebuffer =3D 0;
> 	ioctl(fd, FBIOPUT_CON2FBMAP, &con2fb);
>
> 	return 0;
> }
>
> After calling ioctl(fd1, TIOCLINUX, &param), the subsequent ioctl(fd, FB=
IOPUT_CON2FBMAP, &con2fb)
> causes the kernel to follow a different execution path:
>
>   set_con2fb_map
>    -> con2fb_init_display
>     -> fbcon_set_disp
>      -> redraw_screen
>       -> hide_cursor
>        -> clear_selection
>         -> highlight
>          -> invert_screen
>           -> do_update_region
>            -> fbcon_putcs
>             -> ops->putcs
>
> Since ops->putcs is a NULL pointer, this leads to a kernel panic.
> To prevent this, we need to call set_blitting_type() within set_con2fb_m=
ap()
> to properly initialize ops->putcs.
>
> Reported-by: syzbot+3d613ae53c031502687a@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D3d613ae53c031502687a
> Tested-by: syzbot+3d613ae53c031502687a@syzkaller.appspotmail.com
> Signed-off-by: Qianqiang Liu <qianqiang.liu@163.com>
> ---
>   Changes since v2:
>   - Document the commit message in more detail

Queued up in for-next branch of fbdev git tree.

Thanks!
Helge


> ---
>   Changes since v1:
>   - Initialize ops->putcs by calling set_blitting_type()
> ---
>   drivers/video/fbdev/core/fbcon.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core=
/fbcon.c
> index 2e093535884b..d9abae2516d8 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -861,6 +861,8 @@ static int set_con2fb_map(int unit, int newidx, int =
user)
>   			return err;
>
>   		fbcon_add_cursor_work(info);
> +	} else if (vc) {
> +		set_blitting_type(vc, info);
>   	}
>
>   	con2fb_map[unit] =3D newidx;


